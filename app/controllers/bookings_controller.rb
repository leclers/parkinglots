class BookingsController < ApplicationController
  def index
    @bookings = booking_policy(Booking)
  end

  def show
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
