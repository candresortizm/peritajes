class CreateCarInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :car_inspections do |t|
      t.references :car, null: false, foreign_key: true
      t.references :car_expert, index: true, foreign_key: {to_table: :users}
      t.string :owner, null:false
      t.decimal :kilometraje, null:false
      t.string :photo_front
      t.string :photo_right
      t.string :photo_back
      t.string :photo_left
      t.string :photo_motor
      t.string :photo_inside
      t.integer :completed_tabs, array: true, default: []
      t.string :state, null: false, default: "open"

      t.timestamps
    end
  end
end
