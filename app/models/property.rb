class Property < ApplicationRecord
  has_many :transactions

  validates :title, :location, :price_per_token, presence: true
end
