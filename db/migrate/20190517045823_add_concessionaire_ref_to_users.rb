class AddConcessionaireRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :concessionaire, foreign_key: true
  end
end
