Rails.application.routes.draw do
  # omniauth
  match '/auth/:provider/callback' => 'sso_client/sessions#create'
  match '/auth/failure' => 'sso_client/sessions#failure'

  # Custom logout
  match '/logout' => 'sso_client/sessions#destroy', as: :logout
end
