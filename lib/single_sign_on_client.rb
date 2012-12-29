module SingleSignOnClient
  module Controllers
    autoload :Helpers, 'single_sign_on_client/controllers/helpers'
  end

  def self.setup
    yield self
  end

  mattr_accessor :provider_url
  @@provider_url = nil

  mattr_accessor :app_id
  @@app_id = nil

  mattr_accessor :app_secret
  @@app_secret = nil

  mattr_accessor :user_decorator
  @@user_decorator = nil

  module ::OmniAuth
    module Strategies
      autoload :SingleSignOn, 'omni_auth/strategies/single_sign_on'
    end
  end
end

require "single_sign_on_client/engine"
