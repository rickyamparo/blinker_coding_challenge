class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :create_vehicles do |t|
      t.string :make
      t.string :model
      t.string :options, array: true, default: []

      t.timestamps
    end
  end
end
