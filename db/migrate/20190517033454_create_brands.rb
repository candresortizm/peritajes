class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.string :address
      t.string :telephone
      t.string :nit

      t.timestamps
    end
  end
end
