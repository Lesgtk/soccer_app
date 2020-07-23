require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Soccer App"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Soccer App"
  end

end
