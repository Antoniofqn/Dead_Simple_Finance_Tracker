# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

type = ["Income", "Expense"]
value = (50..100).to_a
category_expense = ["Rent", "Mortgage", "House Bills", "Insurance", "Health", "Groceries", "Fuel", "Interest", "Leisure"]
category_income = ["Salary", "Dividends", "Other"]




300.times do
  puts "creating now"
  date = ((Date.today - 365)..Date.today).to_a.sample
  transaction = Transaction.new(type_transaction: type.sample, date: date, value: value.sample, user_id: 1)
  if transaction.type_transaction == "Expense"
    transaction.category = category_expense.sample
  else
    transaction.category = category_income.sample
  end
  if transaction.save
    puts "saved!"
    p transaction
  end
end
