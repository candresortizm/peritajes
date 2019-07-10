class CreateConcessionaires < ActiveRecord::Migration[5.2]
  def change
    create_table :concessionaires do |t|
      t.string :name, null: false
      t.string :address
      t.string :telephone
      t.string :nit, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
