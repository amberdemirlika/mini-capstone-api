class ProductsController < ApplicationController
  def one
    render json: { message: "hello" }
  end
end
