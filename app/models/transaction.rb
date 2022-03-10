class Transaction < ApplicationRecord
  belongs_to :user

  validates :type_transaction, :date, :value, :category, presence: true
end
