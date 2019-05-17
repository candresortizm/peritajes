class CreateInspectionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :inspection_comments do |t|
      t.references :car_inspection, foreign_key:true, null:false
      t.references :question_category, foreign_key: true
      t.string :comment, null:false

      t.timestamps
    end
  end
end
