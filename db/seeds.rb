Vehicle.destroy_all
Option.destroy_all
VehiclesOption.destroy_all

FAKE_MAKE = ["hyundai", "subaru", "volkswagen", "toyota", "ford"]
FAKE_MODEL = ["smart", "2-door", "4-door", "truck", "self-driving"]
FAKE_OPTIONS = ["air conditioning", "cup holders", "spinning rims", "aux port", "hybrid"]

puts "Creating Vehicles"
10.times do
  Vehicle.create(
    make: FAKE_MAKE[rand(0..4)],
    model: FAKE_MODEL[rand(0..4)],
  )
end

puts "Finished creating Vehicles"

puts "Creating Options"

FAKE_OPTIONS.each do |option|
  Option.create(name: option)
end

puts "Finished creating options"

puts "Creating associations between Vehicles and Options"
vehicles = Vehicle.all

vehicles.each do |vehicle|
  options = Option.all.sample(rand(0..5))
  options.each do |option|
    VehiclesOption.create(vehicle_id: vehicle.id, option_id: option.id)
  end
end
