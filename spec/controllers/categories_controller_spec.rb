require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  describe "#create" do
    before { post "/categories", params: { name: "name"} }
    specify("should created one category") { change{ Category.count }.from(0).to(1) }
  end
end
