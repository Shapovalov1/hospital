class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @doctors = filter_doctors
    if current_user.type == 'Patient'
      render :patient_index
    elsif current_user.type == 'Doctor'
      render :doctor_index
    elsif current_user.type == 'Admin'
      render :admin_index
    end
  end

  private

  def filter_doctors
    return Doctor.all if params[:category_id].blank?
    Doctor.where(category_id: params[:category_id])
  end
end
