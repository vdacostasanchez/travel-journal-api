class JournalEntriesController < ApplicationController
  def index
    @journal_entries = JournalEntry.all
    render :index
  end
end
