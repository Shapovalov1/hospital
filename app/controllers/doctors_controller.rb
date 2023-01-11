class DoctorsController < ApplicationController
  def new; end

  def create
    Doctor.create(**permit_params)
    redirect_to controller: :profiles, action: :index
  end

  private

  def permit_params
    params.permit(:first_name, :last_name, :phone_number, :password, :category_id)
  end
end