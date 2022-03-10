# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

type = ["income", "expense"]
date = Date.new(2022, 03, [1,2,3].sample)
value = (50..100).to_a
category = ["food", "home", "pleasure"]



10.times do
  puts "creating now"
  transaction = Transaction.new(type_transaction: type.sample, date: date, value: value.sample, category: category.sample, user_id: 1)
  if transaction.save
    puts "saved!"
  end
end
