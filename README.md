# Budgeteer Service

## Setup

### Installation
```sh
bundle install
bundle exec rake db:setup
```

### Data Setup
```sh
rails console
```

```sh
100.times{
UserBudget.create income: rand(300_000..420_000), housing:rand(100_000..250_000), utilities:rand(10_000..25_000), food:rand(10_000..30_000), transportation:rand(50_000..70_000), healthcare:rand(10_000..15_000), insurance:rand(8000..12_000), entertainment:rand(6_000..250_000), clothing:rand(7_000..12_000), savings:rand(0..30_000), gas:rand(6_000..200), internet:rand(20_00..15_000)}
```

## Running App
```sh
bundle exec rails server
```