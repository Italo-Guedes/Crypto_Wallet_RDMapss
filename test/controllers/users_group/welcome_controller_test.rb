require 'test_helper'

class UsersGroup::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_group_welcome_index_url
    assert_response :success
  end

end
