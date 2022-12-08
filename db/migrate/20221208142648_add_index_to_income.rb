class AddIndexToIncome < ActiveRecord::Migration[7.0]
  def change
    add_index :user_budgets, :income
  end
end
