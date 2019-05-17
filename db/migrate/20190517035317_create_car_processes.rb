class CreateCarProcesses < ActiveRecord::Migration[5.2]
  def change
    create_table :car_processes do |t|
      t.integer :dispatcher_id, index: true, foreign_key: true
      t.references :car, null: false, index: true, foreign_key: true
      t.string :state, null:false

      t.timestamps
    end
  end
end
