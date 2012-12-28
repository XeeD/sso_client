module SingleSignOnClient
  class User < ActiveRecord::Base
    attr_accessible :uid

    serialize :properties

    def self.from_omniauth(omniauth)
      find_or_create_by_uid(omniauth['uid']) do |user|
        user.properties = omniauth['extra']
      end
    end

    def properties=(properties)
      self[:properties] = properties.symbolize_keys
    end

    def method_missing(method_name, *args)
      if properties.has_key?(method_name)
        properties[method_name]
      else
        super
      end
    end
  end
end
