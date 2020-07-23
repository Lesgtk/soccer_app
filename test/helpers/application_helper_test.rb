require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Soccer App"
    assert_equal full_title("About"), "About | Soccer App"
  end
end
