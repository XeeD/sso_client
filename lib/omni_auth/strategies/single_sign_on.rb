require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class SingleSignOn < OmniAuth::Strategies::OAuth2

      option :client_options, {
          :site => SSOClient.provider_url,
          :authorize_url => "#{SSOClient.provider_url}/auth/single_sign_on/authorize",
          :access_token_url => "#{SSOClient.provider_url}/auth/single_sign_on/access_token"
      }

      uid { raw_info['id'] }

      info do
        {
            :email => raw_info['email']
        }
      end

      extra do
        {
            :first_name => raw_info['extra']['first_name'],
            :last_name => raw_info['extra']['last_name']
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/auth/single_sign_on/user.json?oauth_token=#{access_token.token}").parsed
      end
    end
  end
end
