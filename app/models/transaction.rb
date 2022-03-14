class Transaction < ApplicationRecord
  belongs_to :user

  validates :type_transaction, :date, :value, :category, presence: true

  EXPENSE_CATEGORIES = ["Rent", "Mortgage", "House Bills", "Insurance", "Health", "Groceries", "Fuel", "Interest", "Leisure"]
  INCOME_CATEGORIES = ["Salary", "Dividends", "Others"]
end
