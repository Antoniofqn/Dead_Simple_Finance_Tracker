class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions
  has_many :goals
  has_one_attached :photo

  def fetch_monthly_income
    income = 0
    transactions = self.transactions.where(transactions: { date: Time.now.beginning_of_month..Time.now.end_of_month })
    transactions.each do |transaction|
      if transaction.type_transaction == "Income"
        income += transaction.value
      end
    end
    format("%.2f", income)
  end

  def fetch_monthly_expense
    expense = 0
    transactions = self.transactions.where(transactions: { date: Time.now.beginning_of_month..Time.now.end_of_month })
    transactions.each do |transaction|
      if transaction.type_transaction == "Expense"
        expense += transaction.value
      end
    end
    format("%.2f", expense)
  end
end
