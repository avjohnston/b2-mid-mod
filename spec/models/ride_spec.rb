require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'validations' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
    it { should belong_to(:park) }
  end

  describe 'methods' do
    before :each do
      @park = Park.create!(name: "Hershey Park", admission: 50)
      @mech1 = Mechanic.create!(name: "Andrew", years_experience: 4)
      @mech2 = Mechanic.create!(name: "Khoa", years_experience: 3)
      @mech3 = Mechanic.create!(name: "Doug", years_experience: 5)
      @ride1 = @park.rides.create!(name: "The Punisher", thrill_rating: 9, open: true)
      @ride2 = @park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
      @ride3 = @park.rides.create!(name: "Ninja", thrill_rating: 8, open: true)
      @ride4 = @park.rides.create!(name: "Back Breaker", thrill_rating: 8, open: true)
      @ride5 = @park.rides.create!(name: "Spine Tingler", thrill_rating: 7, open: false)
      @ride6 = @park.rides.create!(name: "Widow Maker", thrill_rating: 10, open: true)
      RideMechanic.create!(ride:@ride1 , mechanic:@mech1)
      RideMechanic.create!(ride:@ride3 , mechanic:@mech1)
      RideMechanic.create!(ride:@ride2 , mechanic:@mech2)
      RideMechanic.create!(ride:@ride4 , mechanic:@mech2)
      RideMechanic.create!(ride:@ride6 , mechanic:@mech3)
      RideMechanic.create!(ride:@ride5 , mechanic:@mech3)
      RideMechanic.create!(ride:@ride2 , mechanic:@mech3)
    end

    it 'open_rides' do
      expect(Ride.open_rides).to eq([@ride1, @ride3, @ride4, @ride6])
      expect(@mech1.rides.open_rides).to eq([@ride1, @ride3])
    end

    it 'order by rating' do
      expect(Ride.order_by_rating).to eq([@ride6, @ride1, @ride3, @ride4, @ride2, @ride5])
      expect(@mech1.rides.order_by_rating).to eq([@ride1, @ride3])
    end

    it 'average thrill rating' do
      expect(Ride.average_thrill_rating.round(1).to_f).to eq(8.2)
    end

    it 'alphabetical order' do
      expect(Ride.alph_order).to eq([@ride4, @ride3, @ride5, @ride2, @ride1, @ride6])
    end
  end
end
