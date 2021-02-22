class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.open_rides.order_by_rating
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    RideMechanic.create(ride: Ride.find(params[:ride_id]), mechanic: @mechanic)
    
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end
