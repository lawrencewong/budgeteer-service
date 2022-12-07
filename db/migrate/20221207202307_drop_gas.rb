class DropGas < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_budgets, :gas, :integer
  end
end
