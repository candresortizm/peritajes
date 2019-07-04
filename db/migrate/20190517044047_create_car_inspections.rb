class CreateCarInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :car_inspections do |t|
      t.references :car, null: false, foreign_key: true
      t.integer :car_expert_id, index:true, foreign_key: true
      t.string :owner, null:false
      t.decimal :kilometraje, null:false
      t.string :color, null:false
      t.string :photo_front
      t.string :photo_right
      t.string :photo_back
      t.string :photo_left
      t.string :photo_motor
      t.string :photo_inside
      t.string :state, null: false, default: "TAB_1"

      t.timestamps
    end
  end
end
