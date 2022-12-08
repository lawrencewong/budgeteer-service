class DataLoader


  def self.call
    create
    create(base_income: 2500)
    create(base_income: 2850)
    create(base_income: 3100)
    create(base_income: 3300)
    create(base_income: 3700)
    create(base_income: 4150)
    create(base_income: 4500)
    create(base_income: 4700)
    create(base_income: 5150)
    create(base_income: 5500)
    create(base_income: 5700)
    create(base_income: 6150)
    create(base_income: 6500)
    create(base_income: 6700)
    create(base_income: 7150)
    create(base_income: 7500)
    create(base_income: 7700)
    create(base_income: 8150)
    create(base_income: 8500)
    create(base_income: 8700)
    create(base_income: 9150)
    create(base_income: 9500)
    create(base_income: 9700)
    create(base_income: 10150)
    create(base_income: 15000)
    create(base_income: 17000)
    create(base_income: 11150)
    create(base_income: 11500)
    create(base_income: 11700)
    create(base_income: 12150)
    create(base_income: 12500)
    create(base_income: 12700)
    create(base_income: 13150)
    create(base_income: 13500)
    create(base_income: 13700)
    create(base_income: 14150)
    create(base_income: 14500)
    create(base_income: 14700)
    create(base_income: 15150)
    create(base_income: 15500)
    create(base_income: 15700)
  end

  # 1 https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1110022201
  # 2 https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=3610058801
  # 3 https://www12.statcan.gc.ca/census-recensement/
  # One caveat is that the number below is the MEAN across all census data not incremental by income
  def self.create(base_income: 3066, count: 500)
    income = generate_normal(mean: base_income, std: 20, count: count)
    housing = generate_normal(mean: 20200 / 12, std: 20, count: count)
    utilities = generate_normal(mean: 2535 / 12, std: 20, count: count)
    food = generate_normal(mean: 10311 / 12, std: 20, count: count)
    transportation = generate_normal(mean: 12737 / 12, std: 20, count: count)
    healthcare = generate_normal(mean: 2780 / 12, std: 20, count: count)
    insurance = generate_normal(mean: 5297 / 12, std: 20, count: count)
    entertainment = generate_normal(mean: 4624 / 12, std: 20, count: count)
    clothing = generate_normal(mean: 3344 / 12, std: 20, count: count)
    savings = generate_normal(mean: 10233 / 12, std: 20, count: count)
    internet = generate_normal(mean: 80, std: 20, count: count)
    debtRepayment = generate_normal(mean: 350, std: 20, count: count)


    data = []
    count.times  do |index|
      data.push(
        {
          income: income[index],
          housing: housing[index],
          utilities: utilities[index],
          food: food[index],
          transportation: transportation[index],
          healthcare: healthcare[index],
          insurance: insurance[index],
          entertainment: entertainment[index],
          clothing: clothing[index],
          savings: savings[index],
          internet: internet[index],
          debtRepayment: debtRepayment[index],
        }
      )
    end

    # Swallow the logger
    old_logger = ActiveRecord::Base.logger
    ActiveRecord::Base.logger = nil

    data.each_with_index do |user, index|
      print "#{index.to_s} "

      UserBudget.create income: user[:income], housing: user[:housing], utilities: user[:utilities], food: user[:food], transportation: user[:transportation], healthcare: user[:healthcare], insurance: user[:insurance], entertainment: user[:entertainment], clothing: user[:clothing], savings: user[:savings], internet: user[:internet], debt_repayment: user[:debtRepayment]
    end

    ActiveRecord::Base.logger = old_logger

    return
  end

  private

  def self.generate_normal(mean:, std:, count:)
    gen = Rubystats::NormalDistribution.new(mean, std)

    gen.rng(count).map do |number|
      (number * 100).to_i
    end
  end
end
