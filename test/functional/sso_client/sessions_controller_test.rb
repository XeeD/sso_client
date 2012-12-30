require 'test_helper'

module SSOClient
  class SessionsControllerTest < ActionController::TestCase
    test "should get failure" do
      get :failure
      assert_response :success
    end
  
  end
end
