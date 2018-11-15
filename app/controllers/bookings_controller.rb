class BookingsController < ApplicationController
  def index
#    @parkings = policy_scope(Booking)
    @requested_bookings = policy_scope(Booking)
    @own_parking_bookings = current_user.own_parkings_bookings


  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
  end

  def create
    @parking = Parking.find(params[:parking_id])
    @booking = Booking.new(booking_params)
    @booking.parking = @parking

    if @booking.save
      redirect_to parking_path(@parking)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
