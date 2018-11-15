class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @parkings = policy_scope(Parking).search_by_city(params[:query]).where.not(latitude: nil, longitude: nil)
    else
      @parkings = policy_scope(Parking).where.not(latitude: nil, longitude: nil)
    end

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
    authorize @parking
  end

  def update
    authorize @parking
    if @parking.update(parking_params)
      flash[:notice] = "great, you have successfully edited your parking space"
      redirect_to parking_path(@parking)
    else
      flash[:alert] = "oops, something is wrong, dude."
      render :edit
    end
  end

  def destroy
    authorize @parking
    @parking.delete
    redirect_to parkings_path
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parking_params
    params.require(:parking).permit(:address, :description, :start_time, :finish_time, :price, :city, :zip_code, :photo)
  end
end
