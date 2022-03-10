class ChangeTypeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :type, :type_transaction
  end
end
