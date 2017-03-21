class CartsController < ApplicationController

  def checkout
    @cart = Cart.find_by_id(params[:id])
  end

  def index
  end

  def show
    @cart = current_user.current_cart
    raise @cart.items.inspect
    #this will show current cart. Need to set the current cart for the user. If already a user, pull their last cart as their current cart, if new user, make a new cart
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
