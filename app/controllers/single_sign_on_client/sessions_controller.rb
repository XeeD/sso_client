require_dependency "single_sign_on_client/application_controller"

module SingleSignOnClient
  class SessionsController < ApplicationController
    before_filter :authenticate_user!, :only => [ :destroy ]

    respond_to :html

    # Omniauth callback method
    def create
      user = User.from_omniauth(env['omniauth.auth'])

      # Currently storing all the info
      session[:user_id] = user.uid

      redirect_to main_app.root_path,
                  notice: t("single_sign_on.messages.logged_in")
    end

    # Omniauth failure callback
    def failure
      flash[:notice] = params[:message]

    end

    # Logout - Clear our rack session BUT essentially redirect to the provider
    # to clean up the Devise session from there too!
    def destroy
      session[:user_id] = nil

      redirect_to "#{SingleSignOnClient.provider_url}/users/sign_out?back=#{URI::encode(main_app.root_url)}",
                  notice: t("single_sign_on.messages.logged_out")
    end
  end
end
