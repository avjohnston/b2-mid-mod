class ParksController < ApplicationController
  def show
    @park = Park.find(params[:id])
    @rides = @park.rides.alph_order
  end
end
