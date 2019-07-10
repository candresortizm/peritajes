class CreateCarBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :car_brands do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
