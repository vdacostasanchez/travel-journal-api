class PlacesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @places = Place.all
    render :index
  end

  def create
    @place = Place.create(
      user_id: current_user.id,
      trip_id: params[:trip_id],
      name: params[:name],
      date: params[:date],
      address: params[:address],
    )
    if @place.save
      render :show
    else
      render json: { error: @place.errors.full_messages }, status: 422
    end
  end

  def show
    @place = Place.find_by(id: params[:id])
    render :show
  end

  def update
    @place = Place.find_by(id: params[:id])
    @place.update(
      user_id: current_user.id || @place.user_id,
      trip_id: params[:trip_id] || @place.trip_id,
      name: params[:name] || @place.name,
      date: params[:date] || @place.date,
      address: params[:address] || @place.address,
    )
    if @place.save
      render :show
    else
      render json: { error: @place.errors.full_messages }, status: 422
    end
  end

  def destroy
    @place = Place.find_by(id: params[:id])
    @place.destroy
    render json: { message: "Place destroyed successfully" }
  end
end
