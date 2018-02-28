class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.text   :options, array: true, default: []

      t.timestamps
    end
  end
end
