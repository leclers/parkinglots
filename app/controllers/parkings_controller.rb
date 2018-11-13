class ParkingsController < ApplicationController
  def index
  end

  def show
  @parking = Parking.find(params[:id])
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
