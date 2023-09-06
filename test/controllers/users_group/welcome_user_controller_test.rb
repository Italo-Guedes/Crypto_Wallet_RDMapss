require 'test_helper'

class UsersGroup::WelcomeUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_group_welcome_user_index_url
    assert_response :success
  end

end
