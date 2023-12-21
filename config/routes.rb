Rails.application.routes.draw do
  #Trip routes
  get "/trips" => "trips#index"

  post "/trips" => "trips#create"

  patch "/trips/:id" => "trips#update"
end
