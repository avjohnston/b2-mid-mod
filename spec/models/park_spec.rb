RSpec.describe Park, type: :model do
  describe 'validations' do
    it { should have_many(:rides) }
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

    it 'admission fix' do
      expect(@park.admission_fix).to eq("50.00")
    end
  end
end
