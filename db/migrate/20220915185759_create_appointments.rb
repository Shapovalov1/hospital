class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :doctor
      t.references :patient
      t.string :recommendation, null: true

      t.timestamps
    end
  end
end
