class CreateEnergyMeters < ActiveRecord::Migration[6.1]
  def change
    create_table :energy_meters do |t|
      t.string :name
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
