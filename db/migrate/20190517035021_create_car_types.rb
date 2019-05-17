class CreateCarTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :car_types do |t|
      t.string :name, null: false
      t.string :reference_photo

      t.timestamps
    end
  end
end
