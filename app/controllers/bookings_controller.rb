class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]
  def index
    @requested_bookings = policy_scope(Booking)
    @own_parking_bookings = current_user.own_parkings_bookings
  end

  def new
    @parking = Parking.find(params[:parking_id])
    @booking = Booking.new
    authorize @booking
  end

  def show
    @parking = Parking.find(params[:parking_id])
    @booking = Booking.new
    @bookings = policy_scope(Booking)
    authorize @booking
  end

  # needs an if statement to not allow selecting dates that are not available
  def create
    @parking = Parking.find(params[:parking_id])
    @booking = Booking.new(booking_params)
    @booking.parking = @parking
    @booking.user = current_user
    authorize @booking
    if @booking.save
      flash[:notice] = "great, you have successfully booked your parking space"
      redirect_to booking_path(@bookng)
    else
      flash[:alert] = "oops, this space is not available for that time, dude."
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      flash[:notice] = "successfully edited your booking"
      redirect_to parking_path(@parking)
    else
      flash[:alert] = "oops, something is wrong, dude."
      render :edit
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :finish_time)
  end
end
