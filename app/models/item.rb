class Item < ApplicationRecord
  validates :name, :price, presence: true
  validates :name, length: { maximum: 50 }
  validates :price, numericality: true
  validates :description, length: { maximum: 200 }

  scope :default_order, -> { order(created_at: :desc) }

  TAX = 1.10

  def price_with_tax
    (price * TAX)
  end
end
