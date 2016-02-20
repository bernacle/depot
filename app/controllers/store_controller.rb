class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize

  def index
    @products = Product.order(:title)
    @count = count
  end

  private

  def count
    if session[:counter].nil?
       session[:counter] = 0
    end
    session[:counter] += 1
  end
end
