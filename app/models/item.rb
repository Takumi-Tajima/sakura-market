class Item < ApplicationRecord
  acts_as_list
  has_one_attached :item_img do |attachable|
    attachable.variant :display, resize_to_limit: [350, 450]
    attachable.variant :thumb, resize_to_limit: [300, 300]
  end

  validates :name, :price, presence: true
  validates :name, length: { maximum: 50 }
  validates :price, numericality: true
  validates :description, length: { maximum: 200 }

  scope :default_order, -> { order(:position) }

  TAX = 1.10

  def price_with_tax
    (BigDecimal(price.to_s) * BigDecimal(TAX.to_s)).to_f
  end
end
