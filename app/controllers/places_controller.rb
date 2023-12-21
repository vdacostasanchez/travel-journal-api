class PlacesController < ApplicationController
  def index
    @places = Place.all
    render :index
  end

  def create
    @place = Place.create(
      trip_id: params[:trip_id],
      user_id: params[:user_id],
      name: params[:name],
      date: params[:date],
      address: params[:address],
    )
    render :show
  end

  def show
    @place = Place.find_by(id: params[:id])
    render :show
  end

  def update
    @place = Place.find_by(id: params[:id])
    @place.update(
      trip_id: params[:trip_id] || @place.trip_id,
      user_id: params[:user_id] || @place.user_id,
      name: params[:name] || @place.name,
      date: params[:date] || @place.date,
      address: params[:address] || @place.address,
    )
    render :show
  end

  def destroy
    @place = Place.find_by(id: params[:id])
    @place.destroy
    render json: { message: "Place destroyed successfully" }
  end
end
