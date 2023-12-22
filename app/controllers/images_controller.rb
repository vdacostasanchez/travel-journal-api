class ImagesController < ApplicationController
  def index
    @images = Image.all
    render :index
  end

  def create
    @image = Image.create(
      user_id: params[:user_id],
      trip_id: params[:trip_id],
      date: params[:date],
      img_url: params[:img_url],
    )
    render :show
  end

  def show
    @image = Image.find_by(id: params[:id])
    render :show
  end

  def update
    @image = Image.find_by(id: params[:id])
    @image.update(
      user_id: params[:user_id] || @image.user_id,
      trip_id: params[:trip_id] || @image.trip_id,
      date: params[:date] || @image.date,
      img_url: params[:img_url] || @image.img_url,
    )
    render :show
  end
end
