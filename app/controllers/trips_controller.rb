class TripsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @trips = Trip.all
    render :index
  end

  def create
    @trip = Trip.create(
      user_id: current_user.id,
      start_date: params[:start_date],
      end_date: params[:end_date],
      location: params[:location],
    )
    if @trip.save
      render :show
    else
      render json: { errors: @trip.errors.full_messages }, status: 422
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    if @trip
      render :show
    else
      render json: { errors: @trip.errors.full_messages }, status: 422
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    @trip.update(
      user_id: current_user.id || @trip.user_id,
      start_date: params[:start_date] || @trip.start_date,
      end_date: params[:end_date] || @trip.end_date,
      location: params[:location] || @trip.location,
    )
    if @trip.valid?
      render :show
    else
      render json: { errors: @trip.errors.full_messages }, status: 422
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy
    render json: { message: "Trip destroyed successfully" }
  end
end
