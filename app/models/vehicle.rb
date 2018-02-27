class Vehicle < ApplicationRecord
  validates_presence_of :make, :model
end
