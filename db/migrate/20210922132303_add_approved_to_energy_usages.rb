class AddApprovedToEnergyUsages < ActiveRecord::Migration[6.1]
  def change
    add_column :energy_usages, :approved, :boolean
  end
end
