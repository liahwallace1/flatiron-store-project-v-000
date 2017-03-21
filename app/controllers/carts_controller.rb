class CartsController < ApplicationController

  def checkout
    @cart = Cart.find_by_id(params[:id])
    @cart.submit!
    Item.update_inventory(@cart)
    current_user.current_cart = nil
    redirect_to cart_path(@cart)
  end

  def show
    @cart = Cart.find_by_id(params[:id])
  end

end
