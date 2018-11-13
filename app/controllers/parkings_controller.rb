class ParkingsController < ApplicationController
  def index
    @parkings = Parking.all
  end

  def new
    @parking = Parking.new
  end

  def create
    raise
  end

  def show
  end

  def update
  end

  def edit
  end

  def delete
  end

  private
  def parking_params
    params.require(:user).permit(:address, :description, :start_time, :finish_time, :price)
  end
end
