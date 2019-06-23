class CreateCarDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :car_documents do |t|
      t.references :document_type, null: false, foreign_key: true
      t.references :car_process, null: false, foreign_key: true
      t.string :document, null: false
      t.string :state, null:false
      t.string :comment

      t.timestamps
    end
  end
end
