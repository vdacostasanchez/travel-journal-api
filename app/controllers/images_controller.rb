class ImagesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @images = Image.all
    render :index
  end

  def create
    @image = Image.create(
      user_id: current_user.id,
      trip_id: params[:trip_id],
      date: params[:date],
      img_url: params[:img_url],
    )
    if @image.save
      render :show
    else
      render json: { errors: @image.errors.full_messages }, status: 422
    end
  end

  def show
    @image = Image.find_by(id: params[:id])
    render :show
  end

  def update
    @image = Image.find_by(id: params[:id])
    @image.update(
      user_id: current_user.id || @image.user_id,
      trip_id: params[:trip_id] || @image.trip_id,
      date: params[:date] || @image.date,
      img_url: params[:img_url] || @image.img_url,
    )
    if @image.valid?
      render :show
    else
      render json: { errors: @image.errors.full_messages }, status: 422
    end
  end

  def destroy
    @image = Image.find_by(id: params[:id])
    @image.destroy
    render json: { message: "Image destroyed successfully" }
  end
end
