class ParkingsController < ApplicationController
  # parkings references devise/user
  # will need to validate user before action
  # current_user OR user_id
  # USE A PUNDIT PUNDIT PUNDIT
  def index
    @parkings = Parking.all
  end

  def show
    @parking = Parking.find(params[:id])
  end

  def new
    # @parking = current_user.parkings.build
    @parking = Parking.new
  end

  def create
    # @parking = current_user.parkings.build(parking_params)
    @parking = Parking.new(parking_params)
    @parking.user = current_user
    @parking.save

    if @parking.save
      # flash[:success] = "Success! Rental space was created."
      redirect_to parkings_path
    else
      # flash[:error] = "Woopsy, please verify your information is correct"
      render :new
    end
  end

  def edit
  end

  private

  def parking_params
    params.require(:parking).permit(:address, :description, :start_time, :finish_time, :price)
  end
end
