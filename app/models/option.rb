class Option < ApplicationRecord
  validates_presence_of :name
  has_many :vehicles_options
  has_many :vehicles, through: :vehicles_options
end
