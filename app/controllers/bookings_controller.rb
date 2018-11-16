class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]

  def index
    @requested_bookings = policy_scope(Booking)
    @own_parkings_bookings = current_user.own_parkings_bookings
  end

  def new
    @parking = Parking.find(params[:id])
    @booking = Booking.new
    authorize @parking
    authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def create
    @parking = Parking.find(params[:parking_id])
    @booking = Booking.new(booking_params)
    @booking.parking = @parking
    @booking.user = current_user
    authorize @booking
    if @booking.save
      flash[:notice] = "great, you have successfully booked your parking space"
      redirect_to booking_path(@booking)
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
    if @booking.update(booking_params) && @booking.status == "accepted"
      flash[:notice] = "booking accepted"
      redirect_to booking_path(@booking)
    elsif @booking.update(booking_params) && @booking.status == "declined"
      flash[:alert] = "booking rejected"
      redirect_to booking_path(@booking)
    else
      render :show
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :finish_time, :status)
  end
end
