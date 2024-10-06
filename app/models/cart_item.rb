class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :ordered_by_creation, -> { order(:created_at) }

  def self.add_or_update(user, item_id, quantity)
    cart_item = user.cart_items.find_or_initialize_by(item_id:)
    # ディフォルトの値が1なので、その分を考慮して-1
    cart_item.quantity += if cart_item.id?
                            quantity.to_i
                          else
                            quantity.to_i - 1
                          end
    cart_item.save
    cart_item
  end
end
