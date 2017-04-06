require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get product_name:string_url
    assert_response :success
  end

  test "should get stock:integer" do
    get product_stock:integer_url
    assert_response :success
  end

  test "should get price:integer" do
    get product_price:integer_url
    assert_response :success
  end

  test "should get max_discount:integer" do
    get product_max_discount:integer_url
    assert_response :success
  end

  test "should get cost:integer" do
    get product_cost:integer_url
    assert_response :success
  end

end
