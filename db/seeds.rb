Vehicle.destroy_all

FAKE_MAKE = ["hyundai", "subaru", "volkswagen", "toyota", "ford"]
FAKE_MODEL = ["smart", "2-door", "4-door", "truck", "self-driving"]
FAKE_OPTIONS = ["air conditioning", "cup holders", "spinning rims", "aux port", "hybrid"]

puts "Creating Vehicles"
10.times do
  options_array = FAKE_OPTIONS.sample(rand(0..4))

  Vehicle.create(
    make: FAKE_MAKE[rand(0..4)],
    model: FAKE_MODEL[rand(0..4)],
    options: options_array
  )
end

puts "Finish creating Vehicles"
