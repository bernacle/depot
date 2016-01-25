class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy # dependent destroy all childs of Cart if it is deleted
end
