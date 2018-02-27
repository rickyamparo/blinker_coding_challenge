FAKE_MAKE = ["hyundai", "subaru", "volkswagen", "toyota", "ford"]
FAKE_MODEL = ["smart", "2-door", "4-door", "truck", "self-driving"]
FAKE_OPTIONS = ["air conditioning", "cup holders", "spinning rims", "aux port", "hybrid"]

FactoryBot.define do
  factory :vehicle do
    make { FAKE_MAKE[rand(0..4)] }
    model { FAKE_MODEL[rand(0..4)] }
    options { FAKE_OPTIONS.sample(rand(0..4)) }
  end
end
