class LineItemsController < ApplicationController

  def create
    if user_signed_in?
      unless @cart #@cart is assigned in Application Controller
        @cart = current_user.carts.create
        current_user.current_cart = @cart
      end
      @cart.add_item(params[:item_id]).save
      redirect_to cart_path(@cart)
    else
      redirect_to new_user_session_path, flash[:notice] => "You need to log in first."
    end
  end
end
