class LineItemsController < ApplicationController

  def create
    raise params.inspect
    @cart = current_user.current_cart
    @cart.add_item()
    redirect_to cart_path(current_user.current_cart.id)
  end
end
