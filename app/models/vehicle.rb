class Vehicle < ApplicationRecord
  validates_presence_of :make, :model
  has_many :vehicles_options
  has_many :options, through: :vehicles_options
end
