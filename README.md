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

Loads 20,000~ records
```sh
DataLoader.call
```

## Starting Server
```sh
bundle exec rails server
```

### GQL Playground
```sh
http://127.0.0.1:3001/graphiql
```
