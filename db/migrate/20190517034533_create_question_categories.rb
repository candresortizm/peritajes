class CreateQuestionCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :question_categories do |t|
      t.string :name, null:false
      t.integer :order_category, null:false

      t.timestamps
    end
  end
end
