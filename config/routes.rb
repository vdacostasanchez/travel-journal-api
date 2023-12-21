Rails.application.routes.draw do
  #Trip routes
  get "/trips" => "trips#index"

  post "/trips" => "trips#create"

  get "/trips/:id" => "trips#show"

  patch "/trips/:id" => "trips#update"

  delete "/trips/:id" => "trips#destroy"
end
