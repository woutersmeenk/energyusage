class EnergyUsage < ApplicationRecord
  belongs_to :energy_meter

  validates :period_start, presence: { message: 'must be a valid date' }
  validates :amount, presence: true, numericality: true
end
