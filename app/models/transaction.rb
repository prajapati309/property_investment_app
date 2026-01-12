class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :tx_type, presence: true
end
