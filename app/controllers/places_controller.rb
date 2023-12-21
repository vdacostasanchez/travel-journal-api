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
end
