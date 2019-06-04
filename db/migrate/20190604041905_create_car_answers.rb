class CreateCarAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :car_answers do |t|
      t.references :car, foreign_key: true
      t.references :question, foreign_key: true
      t.string :answer

      t.timestamps
    end
  end
end
