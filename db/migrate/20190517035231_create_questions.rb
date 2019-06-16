class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :question_category,null:false, index: true, foreign_key: true
      t.string :text_query, null:false
      t.string :question_type, null:false
      t.string :options, array:true, default:[]
      t.integer :points, null:false
      t.integer :order_question, null:false
      t.string :key, index:true, null:false

      t.timestamps
    end
  end
end
