class CreateCarInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :car_inspections do |t|
      t.references :car, null: false, foreign_key: true
      t.integer :car_expert_id, index:true, foreign_key: true
      t.string :owner, null:false
      t.decimal :kilometraje, null:false
      t.string :color, null:false
      t.string :photo_front, null:false
      t.string :photo_right, null:false
      t.string :photo_back, null:false
      t.string :photo_left, null:false
      t.string :photo_motor, null:false
      t.string :photo_inside, null:false

      t.timestamps
    end
  end
end
