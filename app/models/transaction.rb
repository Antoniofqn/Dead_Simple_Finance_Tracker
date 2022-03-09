class Transaction < ApplicationRecord
  belongs_to :user

  validates :type, :date, :value, :category, presence: true
end
