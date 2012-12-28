require "omniauth"
require "omniauth-oauth2"
require "haml"

module SingleSignOnClient
  class Engine < ::Rails::Engine
    isolate_namespace SingleSignOnClient

    config.generators do |g|
      g.template_engine :haml
    end

    initializer 'single_sign_on_client.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        include SingleSignOnClient::Controllers::Helpers
      end
    end

    initializer 'single_sign_on_client.action_controller', after: 'load_config_initializers' do |app|
      # Add SignleSignOn strategy to omniauth
      app.config.middleware.use OmniAuth::Builder do
        provider :single_sign_on, SingleSignOnClient.app_id, SingleSignOnClient.app_secret
      end
    end
  end
end
