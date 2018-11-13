class ParkingsController < ApplicationController
  # parkings references devise/user
  # will need to validate user before action
  # current_user OR user_id
  # USE A PUNDIT PUNDIT PUNDIT
  def index
    @parkings = Parking.all
  end

  def new
    @parking = current_user.parkings.build
  end

  def create
    @parking = current_user.parkings.build(parking_params)
    if @parking.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  protected
  def parking_params
    params.require(:parking).permit(:address, :description, :start_time, :finish_time, :price)
  end
end
