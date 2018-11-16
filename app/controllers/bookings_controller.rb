class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]
  before_action :verify_dates, only: [:create]

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
    authorize @booking
  end

  # needs an if statement to not allow selecting dates that are not available
  def create
    @parking = Parking.find(params[:parking_id])
    @booking = Booking.new(booking_params)
    @booking.parking = @parking
    @booking.user = current_user
    authorize @booking
    # user should not be allowed to create/book the space if booking already exists
    if verify_dates == true
      flash[:alert] = "oops, this space is not available for those dates, dude."
      render :new
    else
      @booking.save
      flash[:notice] = "great, you have successfully booked your parking space"
      redirect_to booking_path(@bookng)
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

  def self.verify_dates(booking_params)
    Booking.where('start_time < ? && finish_time > ?', self.start_time, self.finish_time)
    booking.present?
  end
end
