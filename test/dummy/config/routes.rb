Rails.application.routes.draw do

  root to: "public#index"

  resources :secrets, only: [:index]

  mount SingleSignOnClient::Engine => "/single_sign_on_client"
end
