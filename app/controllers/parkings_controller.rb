class ParkingsController < ApplicationController
  # parkings references devise/user
  # will need to validate user before action
  # current_user OR user_id
  # USE A PUNDIT PUNDIT PUNDIT
  def index
    @parkings = policy_scope(Parking).where.not(latitude: nil, longitude: nil)
    # @parkings = Parking.

    @markers = @parkings.map do |parking|
      {
        lng: parking.longitude,
        lat: parking.latitude,
        infoWindow: { content: render_to_string(partial: "/parkings/map_window_index", locals: { parking: parking }) }
      }
    end
  end

  def show
    @parking = Parking.find(params[:id])
    @marker = {
        lng: @parking.longitude,
        lat: @parking.latitude,
        infoWindow: { content: render_to_string(partial: "/parkings/map_window_show", locals: { parking: @parking }) }
    }
    authorize @parking
  end

  def new
    @parking = Parking.new
    authorize @parking
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user = current_user
    @parking.save
    authorize @parking

    if @parking.save
      flash[:notice] = "great, you have successfully uploaded your parking space"
      redirect_to parking_path(@parking)
    else
      flash[:alert] = "oops, something is wrong, dude."
      render :new
    end
  end

  def edit
  end

  private

  def parking_params
    params.require(:parking).permit(:address, :description, :city, :start_time, :finish_time, :price)
  end
end
