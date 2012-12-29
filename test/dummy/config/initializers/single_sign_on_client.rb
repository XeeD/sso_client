SSO_PROVIDER_SETTINGS_FILE = File.join(Rails.root, "config", "sso_provider.yml")

unless File.exist?(SSO_PROVIDER_SETTINGS_FILE)
  raise <<-CONFIG_ERROR
You need to create #{SSO_PROVIDER_SETTINGS_FILE} file in config/ directory.
Example can be found in config/sso_provider.sample.yml file
CONFIG_ERROR
end

# Load settings
SSO_PROVIDER = YAML.load_file(SSO_PROVIDER_SETTINGS_FILE).symbolize_keys

# Setup the client
SingleSignOnClient.setup do |config|
  config.provider_url   = SSO_PROVIDER[:provider_url]
  config.app_id         = SSO_PROVIDER[:app_id]
  config.app_secret     = SSO_PROVIDER[:app_secret]
  config.user_decorator = UserDecorator
end
