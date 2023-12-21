Rails.application.routes.draw do
  #Trip routes
  get "/trips" => "trips#index"
  post "/trips" => "trips#create"
  get "/trips/:id" => "trips#show"
  patch "/trips/:id" => "trips#update"
  delete "/trips/:id" => "trips#destroy"

  #Journal Entries
  get "/journal_entries" => "journal_entries#index"
  post "/journal_entries" => "journal_entries#create"
  get "/journal_entries/:id" => "journal_entries#show"
  patch "/journal_entries/:id" => "journal_entries#update"
  delete "/journal_entries/:id" => "journal_entries#destroy"
end
