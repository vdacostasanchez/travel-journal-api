class TripsController < ApplicationController
  def index
    @trips = Trip.all
    render :index
  end

  def create
    @trip = Trip.create(
      user_id: params[:name],
      start_date: params[:start_date],
      end_date: params[:end_date],
      location: params[:location],
    )
    render :show
  end
end
