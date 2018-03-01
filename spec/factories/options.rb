FAKE_OPTIONS = ["air conditioning", "cup holders", "spinning rims", "aux port", "hybrid"]

FactoryBot.define do
  factory :option do
    name { FAKE_OPTIONS[rand(0..4)] }
  end
end
