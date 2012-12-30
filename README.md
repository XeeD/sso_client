SSOClient
=========
*Single Sign On for your Rails application*

SSOClient is a Rails Engine that enables user authentication by third party provider.

Installation
------------
To install the engine, you need to include the gem in you Gemfile, copy the engine's migrations and run them.

    gem 'sso_client', git: 'https://github.com/XeeD/sso_client'
    bundle install
    rake sso_client:install:migrations
    rake db:migrate

You do not need to mount the engine in `routes.rb` as the engine add its paths into the global scope
(paths are not namespaced).

It will create single_sign_on_client_users table. This table is used to store IDs of all clients that
authenticate through 3rd party application as well as all their 'extra' data (stored as hashes in
`properties` attribute).

Configuration
-------------
To configure the application, create a Ruby script in `config/initializers`, for example
`single_sign_on_client.rb`.

    SSOClient.setup do |config|
      config.provider_url = "http://sso-provider.dev"
      config.app_id = "MyApp"
      config.app_secret = "12345678901234567890"
      config.user_decorator = UserDecorator
    end


There are 4 configuration options:
-   provider_url: URL of application that provides authentication
-   app_id: registered name of application at SSOProvider
-   ap_secret: secret associated with the app at SSOProvider
-   user_decorator: module that, if supplied, will be mixed-in into the User class (see test/dummy for example)

How to use in your Rails application
------------------------------------
Inside controllers as a before filter:

    SomeController < ApplicationController
      before_filter :authenticate_user!
    end

This filter will redirect the user to the provider to sign in (if the user is not signed in).

Helpers (usable in controllers and views):
-   `login_path` - omniauth entry point, that redirects user to the provider for sign-on
-   `logout_path` - this will logout the user in the application as well as at the provider and redirect back
-   `current_user` - SingleSignOnClient::User instance

Authentication provider
-----------------------
This gem is intended to authenticate through Rails application that mount SSOProvider engine.
You can find the engine as a gem in this repository: [SSOProvider](https://github.com/XeeD/sso_provider).

Credit
------
Based on [sso-devise-omniauth-client](https://github.com/joshsoftware/sso-devise-omniauth-client)
demo application by Gautam Rege.
