class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @parking = Parking.find(params[:parking_id])
    @booking = Booking.new
    authorize @booking
  end

  def show
    @parking = Parking.find(params[:parking_id])
    @booking = Booking.new
  end

  def create
    @parking = Parking.find(params[:parking_id])
    @booking = Booking.new(booking_params)
    @booking.parking = @parking
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to parking_path(@parking)
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :finish_time)
  end
end

  # def booking_params
  #   params.require(:booking).permit([:user_id, :parking_id, :start_time, :finish_time])
  # end
