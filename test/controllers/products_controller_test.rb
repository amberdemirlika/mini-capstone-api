require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end
end

#   test "create" do
#     post "/products.json", params: {}
#   # test "the truth" do
#   #   assert true
#   # end

# end
