Rails.application.routes.draw do
  # omniauth
  match '/auth/:provider/callback' => 'single_sign_on_client/sessions#create'
  match '/auth/failure' => 'single_sign_on_client/sessions#failure'

  # Custom logout
  match '/logout' => 'single_sign_on_client/sessions#destroy', as: :logout
end
