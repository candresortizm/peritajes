class CreateCarAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :car_answers do |t|
      t.references :car_inspection, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :answer

      t.timestamps
    end
  end
end
