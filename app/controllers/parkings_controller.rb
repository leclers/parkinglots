class ParkingsController < ApplicationController
  # parkings references devise/user
  # will need to validate user before action
  # current_user OR user_id
  # USE A PUNDIT PUNDIT PUNDIT
  def index
    @parkings = policy_scope(Parking)
    @parkings = Parking.where.not(latitude: nil, longitude: nil)

    @markers = @parkings.map do |parking|
      {
        lng: parking.longitude,
        lat: parking.latitude
      }
    end
  end

  def show
    @parking = Parking.find(params[:id])
    authorize @parking
  end

  def new
    # @parking = current_user.parkings.build
    @parking = Parking.new
    authorize @parking
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user = current_user
    @parking.save

    authorize @parking

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
