class CreateUserBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :user_budgets do |t|
      t.integer :income
      t.integer :housing
      t.integer :utilities
      t.integer :food
      t.integer :transportation
      t.integer :healthcare
      t.integer :insurance
      t.integer :entertainment
      t.integer :clothing
      t.integer :savings
      t.integer :internet

      t.timestamps
    end
  end
end
