class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validate :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :ordered_by_creation, -> { order(:created_at) }
end
