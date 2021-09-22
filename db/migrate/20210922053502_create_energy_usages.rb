class CreateEnergyUsages < ActiveRecord::Migration[6.1]
  def change
    create_table :energy_usages do |t|
      t.date :period_start
      t.decimal :amount
      t.references :energy_meter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
