require "test_helper"

class Public::Customers::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_customers_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_customers_addresses_edit_url
    assert_response :success
  end
end
