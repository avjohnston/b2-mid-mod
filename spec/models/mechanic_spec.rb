require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'validations' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'methods' do
    before :each do
      @mech1 = Mechanic.create!(name: "Andrew", years_experience: 4)
      @mech2 = Mechanic.create!(name: "Khoa", years_experience: 3)
      @mech3 = Mechanic.create!(name: "Doug", years_experience: 5)
      @ride1 = Ride.create!(name: "The Punisher", thrill_rating: 9, open: true)
      @ride2 = Ride.create!(name: "The Hurler", thrill_rating: 7, open: false)
      @ride3 = Ride.create!(name: "Ninja", thrill_rating: 8, open: true)
      @ride4 = Ride.create!(name: "Back Breaker", thrill_rating: 8, open: true)
      @ride5 = Ride.create!(name: "Spine Tingler", thrill_rating: 7, open: false)
      @ride6 = Ride.create!(name: "Widow Maker", thrill_rating: 10, open: true)
      RideMechanic.create!(ride:@ride1 , mechanic:@mech1)
      RideMechanic.create!(ride:@ride3 , mechanic:@mech1)
      RideMechanic.create!(ride:@ride2 , mechanic:@mech2)
      RideMechanic.create!(ride:@ride4 , mechanic:@mech2)
      RideMechanic.create!(ride:@ride6 , mechanic:@mech3)
      RideMechanic.create!(ride:@ride5 , mechanic:@mech3)
      RideMechanic.create!(ride:@ride2 , mechanic:@mech3)
    end

    it 'average experience' do
      expect(Mechanic.average_experience).to eq(4)
    end
  end
end
