class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :type
      t.date :date
      t.float :value
      t.string :category
      t.string :tag
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
