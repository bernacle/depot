class StoreController < ApplicationController

  before_action :how_many, only: [:index]

  def index
    @products = Product.order(:title)
  end

  private

    def how_many
      if session[:counter].nil?
         session[:counter] = 1
      else
         session[:counter] += 1
      end
    end
end
