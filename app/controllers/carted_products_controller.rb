class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    render :index
  end

  def create
    @carted_products = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
    @carted_products.save
    render :show
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.status = "removed"
    @carted_product.save
    render json: { mesage: "item removed" }
  end
end
