require 'test_helper'

class HasProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @has_product = has_products(:one)
  end

  test "should get index" do
    get has_products_url
    assert_response :success
  end

  test "should get new" do
    get new_has_product_url
    assert_response :success
  end

  test "should create has_product" do
    assert_difference('HasProduct.count') do
      post has_products_url, params: { has_product: { color: @has_product.color, design: @has_product.design, order_id: @has_product.order_id, product_id: @has_product.product_id, quantity: @has_product.quantity, specs_b: @has_product.specs_b, specs_f: @has_product.specs_f } }
    end

    assert_redirected_to has_product_url(HasProduct.last)
  end

  test "should show has_product" do
    get has_product_url(@has_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_has_product_url(@has_product)
    assert_response :success
  end

  test "should update has_product" do
    patch has_product_url(@has_product), params: { has_product: { color: @has_product.color, design: @has_product.design, order_id: @has_product.order_id, product_id: @has_product.product_id, quantity: @has_product.quantity, specs_b: @has_product.specs_b, specs_f: @has_product.specs_f } }
    assert_redirected_to has_product_url(@has_product)
  end

  test "should destroy has_product" do
    assert_difference('HasProduct.count', -1) do
      delete has_product_url(@has_product)
    end

    assert_redirected_to has_products_url
  end
end
