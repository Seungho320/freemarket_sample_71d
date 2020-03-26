require 'test_helper'

class CardControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get card_new_url
    assert_response :success
  end

  test "should get show" do
    get card_show_url
    assert_response :success
  end

end
