require 'rails_helper'

RSpec.describe Doctor, type: :model do

  describe "Uniqness" do
    let!(:doctor1) { Doctor.create(phone_number: 123, category_id: 2, password: 111111) }
    let!(:doctor2) { Doctor.create(phone_number: 123, category_id: 2, password: 111111) }

    it "is invalid with same phone_numbers" do
      expect(doctor2).to_not be_valid
    end
  end

  describe "Format" do
    let!(:doctor1) { Doctor.create(phone_number: "qwer", category_id: 2, password: 111111) }

    it "is invalid with same phone_numbers" do
      expect(doctor1).to_not be_valid
    end
  end
end
