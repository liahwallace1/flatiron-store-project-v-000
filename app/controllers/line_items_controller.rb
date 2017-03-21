class LineItemsController < ApplicationController

  def create
    raise params.inspect
    if current_user.current_cart
      @cart = current_user.current_cart
    else
      @cart = current_user.carts.create
      current_user.current_cart = @cart
    end
    @cart.add_item(params[:item_id])
    redirect_to cart_path(current_user.current_cart.id)
  end
end
