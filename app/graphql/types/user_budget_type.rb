module Types
  class UserBudgetType < Types::BaseObject
    field :id, ID, null: false
    field :income, Integer, null: false
    field :housing, Integer, null: false
    field :utilities, Integer, null: false
    field :food, Integer, null: false
    field :transportation, Integer, null: false
    field :healthcare, Integer, null: false
    field :insurance, Integer, null: false
    field :entertainment, Integer, null: false
    field :clothing, Integer, null: false
    field :savings, Integer, null: false
    field :internet, Integer, null: false
  end
end
