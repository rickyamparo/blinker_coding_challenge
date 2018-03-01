require 'rails_helper'

RSpec.describe VehiclesOption, type: :model do
  it { should belong_to(:vehicle) }
  it { should belong_to(:option) }
end
