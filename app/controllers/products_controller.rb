class ProductsController < ApplicationController
  def one
    @product = Product.find_by(id: 3)
    render template: "products/show"
  end
end
