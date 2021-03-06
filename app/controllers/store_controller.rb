class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize

  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title).where(locale: I18n.locale)
      @count = count
    end
  end

  private

  def count
    if session[:counter].nil?
       session[:counter] = 0
    end
      session[:counter] += 1
  end
end
