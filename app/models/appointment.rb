class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validate :doctors_appointments, on: :create

  scope :active, -> { where(recommendation: nil) }

  def active?
    recommendation.nil?
  end

  def doctors_appointments
    errors.add(:doctor, "has many appointments") if doctor.appointments.active.count >= 10
  end
end
