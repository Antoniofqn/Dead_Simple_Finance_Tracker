module ApplicationHelper
  def extract_values(transactions)
    transactions.map { |x| x.type_transaction == "expense" ? x.value * -1 : x.value }
  end
end
