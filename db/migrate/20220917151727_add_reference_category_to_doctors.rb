class AddReferenceCategoryToDoctors < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :doctor_id, :integer
    add_reference :users, :category, index: true
  end
end
