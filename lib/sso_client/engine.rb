require "omniauth"
require "omniauth-oauth2"
require "haml"

module SSOClient
  class Engine < ::Rails::Engine
    isolate_namespace SSOClient

    config.generators do |g|
      g.template_engine :haml
    end

    initializer 'sso_client.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        include SSOClient::Controllers::Helpers
      end
    end

    initializer 'sso_client.action_controller', after: 'load_config_initializers' do |app|
      # Add SignleSignOn strategy to omniauth
      app.config.middleware.use OmniAuth::Builder do
        provider :single_sign_on, SSOClient.app_id, SSOClient.app_secret
      end
    end
  end
end
