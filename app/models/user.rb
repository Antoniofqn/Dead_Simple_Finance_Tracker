class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions
  has_one_attached :photo

  def fetch_total_income
    income = 0
    transactions = self.transactions
    transactions.each do |transaction|
      if transaction.type_transaction == "Income"
        income += transaction.value
      end
    end
    format("%.2f", income)
  end

  def fetch_total_expense
    expense = 0
    transactions = self.transactions
    transactions.each do |transaction|
      if transaction.type_transaction == "Expense"
        expense += transaction.value
      end
    end
    format("%.2f", expense)
  end
end
