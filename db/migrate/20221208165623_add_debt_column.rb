class AddDebtColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :user_budgets, :debt_repayment, :integer
  end
end
