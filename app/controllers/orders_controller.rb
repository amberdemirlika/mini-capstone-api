class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
    render :index
  end

  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.create(
      user_id: params[:user_id],
      product_id: params[:products_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )
    @order.save
    render :show
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render :show
    else
      render json: {}, status: :unauthorized
    end
  end
end
