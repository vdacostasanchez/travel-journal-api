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
end
