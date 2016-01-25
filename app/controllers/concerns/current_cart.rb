module CurrentCart
  extend ActiveSupport::Concern

  private
    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound  # if it does not found the Cart, it creates a new one and store the cart_id on the session
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
end
