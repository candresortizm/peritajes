class CreateCarInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :car_inspections do |t|
      t.references :car, null: false, foreign_key: true
      t.integer :car_expert_id, index:true, foreign_key: true
      t.string :owner, null:false
      
      t.timestamps
    end
  end
end
