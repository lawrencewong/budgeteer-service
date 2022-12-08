class UserBudget < ApplicationRecord
  CACHE_KEY_PREFIX = "#{self.name}".freeze

  def self.by_income_variance(income:, variance:)
    Rails.cache.fetch(
      "#{CACHE_KEY_PREFIX}/#{income}/#{variance}",
      expires_in: 12.hours) do
      income *= 100
      variance *= 100

      UserBudget.where(income: income - variance..income + variance)
    end
  end
end
