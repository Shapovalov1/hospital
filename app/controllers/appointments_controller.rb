class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_appointment!, only: %i[edit update]

  def create
    Appointment.create(patient: patient, doctor: doctor)
    redirect_to controller: :profiles, action: :index
  end

  def edit; end

  def update
    @appointment.update(recommendation: params[:appointment][:recommendation])
    redirect_to controller: :profiles, action: :index
  end

  private

  def patient
    Patient.find(params['patient'].to_i)
  end

  def doctor
    Doctor.find(params['doctor'].to_i)
  end

  def find_appointment!
    @appointment = Appointment.find(params[:id])
  end
end
