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

  #Places
  get "/places" => "places#index"
  post "/places" => "places#create"
  get "/places/:id" => "places#show"
  patch "/places/:id" => "places#update"
  delete "/places/:id" => "places#destroy"

  #Users
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"
end
