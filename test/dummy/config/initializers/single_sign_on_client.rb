SingleSignOnClient.setup do |config|
  config.provider_url = "http://localhost:3000"
  config.app_id = "ELVO"
  config.app_secret = "1234"
  config.user_decorator = UserDecorator
end
