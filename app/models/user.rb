class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy

  scope :default_order, -> { order(:created_at) }
end
