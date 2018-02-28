class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.text :make
      t.text :model

      t.timestamps
    end
  end
end
