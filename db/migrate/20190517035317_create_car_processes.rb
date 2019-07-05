class CreateCarProcesses < ActiveRecord::Migration[5.2]
  def change
    create_table :car_processes do |t|
      t.references :dispatcher, index: true, foreign_key: {to_table: :users}
      t.references :car, null: false, index: true, foreign_key: true
      t.string :state, null:false
      t.string :process_type, null:false, default:"sell"

      t.timestamps
    end
  end
end
