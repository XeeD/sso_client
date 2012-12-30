Rails.application.routes.draw do

  root to: "public#index"

  resources :secrets, only: [:index]

  mount SSOClient::Engine => "/sso_client"
end
