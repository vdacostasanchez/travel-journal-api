class JournalEntriesController < ApplicationController
  def index
    @journal_entries = JournalEntry.all
    render :index
  end

  def create
    @journal_entry = JournalEntry.create(
      title: params[:title],
      date: params[:date],
      entry: params[:entry],
      trip_id: params[:trip_id],
      user_id: params[:user_id],
      public: params[:public],
    )
    render :show
  end

  def show
    @journal_entry = JournalEntry.find_by(id: params[:id])
    render :show
  end
end
