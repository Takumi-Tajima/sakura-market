class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  scope :default_order, -> { order(:created_at) }
end
