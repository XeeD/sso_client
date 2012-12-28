module SingleSignOnClient
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      included do
        helper_method :current_user, :user_logged_in?, :login_path
      end


      protected

      def authenticate_user!
        unless user_logged_in?
          respond_to do |format|
            format.html  {
              redirect_to login_path
            }
            format.json {
              render :json => { 'error' => 'Access Denied' }.to_json
            }
          end
        end
      end

      def user_logged_in?
        !!current_user
      end

      def current_user
        if session[:user_id].present?
          @current_user ||= User.find_by_uid(session[:user_id])
        end
      end

      def login_path
        "/auth/singlesignon"
      end
    end
  end
end
