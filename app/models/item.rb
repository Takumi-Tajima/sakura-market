class Item < ApplicationRecord
  validates :name, :price, presence: true
  validates :name, length: { maximum: 50 }
  validates :price, numericality: true
  validates :description, length: { maximum: 200 }
end
