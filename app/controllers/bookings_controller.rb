class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]
  # before_action :verify_dates, only: [:create]
  # :verify_dates(booking_parrams) ????

  def index
    @requested_bookings = policy_scope(Booking)
    @own_parking_bookings = current_user.own_parkings_bookings
  end

  def new
    @parking = Parking.find(params[:id])
    @booking = Booking.new
    authorize @parking
    authorize @booking
  end

  def show
    @parking = Parking.find(params[:id])
    @booking = Booking.find(param[:id])
    # @bookings = policy_scope(Booking)
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

    if @booking.valid? && verify_dates(@booking, @parking)
      @booking.save
      flash[:notice] = "great, you have successfully booked your parking space"
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "oops, this space is not available for those dates, dude."
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

  # below gives undefined method: verify_dates Did you mean verify_authorized
  def verify_dates(booking, parking)
    if booking.start_time > parking.start_time && booking.finish_time < parking.finish_time
      desired_booking = [(booking.start_time..booking.finish_time)]
      existing_bookings = parking.bookings.map { |existing_bkng| (existing_bkng.start_time..existing_bkng.finish_time) }
      array_of_ranges = desired_booking + existing_bookings
      true unless Overlaps.find(array_of_ranges).empty?
    end
    false
  end
  # def verify_dates
  #   ('start_time, finish_time').overlaps?('start_time, finish_time')
  # end

  # def verify_dates

  # end
end
