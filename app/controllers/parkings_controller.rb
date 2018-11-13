class ParkingsController < ApplicationController
  def index
    @parkings = policy_scope(Parking)
  end

  def show
    @parking = Parking.find(params[:id])
    authorize @parking
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end
end
