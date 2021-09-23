class EnergyMeter < ApplicationRecord
  has_many :energy_usages, :dependent => :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :start, presence: { message: 'must be a valid date' }
  validates :end, presence: { message: 'must be a valid date' }
end
