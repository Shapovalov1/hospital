class CategoriesController < ApplicationController
  def new; end

  def create
    Category.create(**permit_params)
    redirect_to controller: :profiles, action: :index
  end

  private

  def permit_params
    params.permit(:name)
  end
end