require 'rails_helper'

RSpec.feature "Doctors", type: :feature do
  let!(:doctor) do
    Doctor.create(phone_number: '1234',
                  first_name: 'John',
                  last_name: 'Madden',
                  password: 'password',
                  password_confirmation: 'password',
                  category_id: category.id
    )
  end
  let!(:patient) do
    Doctor.create(phone_number: '12345',
                  first_name: 'Tara',
                  last_name: 'Brazil',
                  password: 'password',
                  password_confirmation: 'password'
    )
  end
  let!(:category) { Category.create(name: 'doc') }
  let(:appointment) { Appointment.create(doctor_id: doctor.id, patient_id: patient.id)}
  scenario 'with correct credentials' do
    visit new_user_session_path

    find('#user_phone_number').fill_in with: '1234'
    find('#user_password').fill_in with: 'password'

    click_button 'Log in'

  end
end
