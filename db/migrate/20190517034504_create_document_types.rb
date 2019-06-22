class CreateDocumentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :document_types do |t|
      t.string :name, null: false
      t.string :key, null:false
      t.string :process_type, null:false, default: "sell"

      t.timestamps
    end
  end
end
