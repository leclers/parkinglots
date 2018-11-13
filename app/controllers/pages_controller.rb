class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @parking = Parking.new
    @parkings = Parking.all
    @home_parkings = Parking.all.sample(3)
  end
end
