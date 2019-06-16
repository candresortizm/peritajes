class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :car_brand, null:false
      t.string :model, null:false
      t.integer :year, null:false
      t.string :plate, null:false, index: true
      t.string :vin, null:false, index: true
      t.references :car_type, null:false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
