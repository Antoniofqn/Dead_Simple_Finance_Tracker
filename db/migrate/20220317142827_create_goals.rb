class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.integer :objective
      t.integer :current_value, default: 0
      t.boolean :achieved, default: false
      t.boolean :cancelled, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
