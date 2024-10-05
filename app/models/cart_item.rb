class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  scope :default_order, -> { order(:created_at) }
end
