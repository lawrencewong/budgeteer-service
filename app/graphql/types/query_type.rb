module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :user_budgets, [UserBudgetType], null: false
    field :user_budgets_by_income, [UserBudgetType], null: true do
      argument :income, Integer, required: true
      argument :variance, Integer, required: true
    end

    def user_budgets
      UserBudget.all
    end

    def user_budgets_by_income(income:, variance:)
      income *= 100
      variance *= 100
      UserBudget.where(income: income - variance..income + variance)
    end
  end
end
