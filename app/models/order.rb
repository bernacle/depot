class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  PAYMENTS_TYPES = ["Check", "Credit Card", "Purchase Order"]
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENTS_TYPES



  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
