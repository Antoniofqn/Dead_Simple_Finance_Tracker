class Transaction < ApplicationRecord
  belongs_to :user

  validates :type_transaction, :date, :value, :category, presence: true

  validates :value, numericality: { only_integer: false, greater_than_or_equal_to: 0 }

  EXPENSE_CATEGORIES = ["Rent", "Mortgage", "House Bills", "Insurance", "Health", "Groceries", "Fuel", "Interest",
                        "Leisure"]
  INCOME_CATEGORIES = ["Salary", "Dividends", "Other"]
  ALL_CATEGORIES = ["Rent", "Mortgage", "House Bills", "Insurance", "Health", "Groceries", "Fuel", "Interest",
                    "Leisure", "Salary", "Dividends", "Others"]
end
