class Admin < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable
  validates :email, :password, presence: true
  validates :password, length: { minimum: 8 }
end
