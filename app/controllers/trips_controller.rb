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

  def show
    @trip = Trip.find_by(id: params[:id])
    render :show
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    @trip.update(
      user_id: params[:user_id] || @trip.user_id,
      start_date: params[:start_date] || @trip.start_date,
      end_date: params[:end_date] || @trip.end_date,
      location: params[:location] || @trip.location,
    )
    render :show
  end
end
