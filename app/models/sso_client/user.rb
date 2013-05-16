module SSOClient
  class User < ActiveRecord::Base
    attr_accessible :uid

    serialize :properties

    if SSOClient.user_decorator
      include SSOClient.user_decorator
    end

    def self.from_omniauth(omniauth)
      find_or_create_by_uid(omniauth['uid']) do |user|
        user.properties = omniauth['extra'] + omniauth['info']
      end
    end

    def properties=(properties)
      self[:properties] = properties.symbolize_keys
    end
  end
end
