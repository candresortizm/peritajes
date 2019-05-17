class CreateCarInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :car_inspections do |t|

      t.timestamps
    end
  end
end
