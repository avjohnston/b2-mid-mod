# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mech1 = Mechanic.create!(name: "Andrew", years_experience: 4)
mech2 = Mechanic.create!(name: "Khoa", years_experience: 3)
mech3 = Mechanic.create!(name: "Doug", years_experience: 5)

ride1 = Ride.create!(name: "The Punisher", thrill_rating: 9, open: true)
ride2 = Ride.create!(name: "The Hurler", thrill_rating: 7, open: false)
ride3 = Ride.create!(name: "Ninja", thrill_rating: 8, open: true)
ride4 = Ride.create!(name: "Back Breaker", thrill_rating: 8, open: true)
ride5 = Ride.create!(name: "Spine Tingler", thrill_rating: 7, open: false)
ride6 = Ride.create!(name: "Widow Maker", thrill_rating: 10, open: true)

RideMechanic.create!(ride:ride1 , mechanic:mech1)
RideMechanic.create!(ride:ride3 , mechanic:mech1)
RideMechanic.create!(ride:ride2 , mechanic:mech2)
RideMechanic.create!(ride:ride4 , mechanic:mech2)
RideMechanic.create!(ride:ride6 , mechanic:mech3)
RideMechanic.create!(ride:ride5 , mechanic:mech3)
RideMechanic.create!(ride:ride2 , mechanic:mech3)
