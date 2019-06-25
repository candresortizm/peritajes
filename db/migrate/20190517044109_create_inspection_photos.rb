class CreateInspectionPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :inspection_photos do |t|
      t.references :car_inspection, foreign_key:true, null:false
      t.references :question, foreign_key: true
      t.string :image, null:false

      t.timestamps
    end
  end
end
