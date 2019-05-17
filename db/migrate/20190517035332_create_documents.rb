class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :document_type, null: false, foreign_key: true
      t.references :car_process, null: false, foreign_key: true
      t.string :image
      t.string :state, null:false

      t.timestamps
    end
  end
end
