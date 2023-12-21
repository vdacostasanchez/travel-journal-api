Rails.application.routes.draw do
  #Trip routes
  get "/trips" => "trips#index"
end
