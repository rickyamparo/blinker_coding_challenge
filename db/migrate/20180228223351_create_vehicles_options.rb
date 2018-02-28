class CreateVehiclesOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles_options do |t|
      t.references :vehicle, foreign_key: true, index: true
      t.references :option, foreign_key: true, index: true

      t.timestamps
    end
  end
end
