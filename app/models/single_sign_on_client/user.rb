module SingleSignOnClient
  class User < ActiveRecord::Base
    attr_accessible :uid

    serialize :properties

    if SingleSignOnClient.user_decorator
      include SingleSignOnClient.user_decorator
    end

    def self.from_omniauth(omniauth)
      find_or_create_by_uid(omniauth['uid']) do |user|
        user.properties = omniauth['extra']
      end
    end

    def properties=(properties)
      self[:properties] = properties.symbolize_keys
    end
  end
end
