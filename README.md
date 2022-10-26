# Jungle

A mini e-commerce application built with Rails. 
Features include add-to-cart and checkout with Stripe,
user authentication, admin dashboard and controls,
Bootstrap CSS styling and a working database connection via PostgreSQL.

Testing done with RSpec and Cypress.

## Screenshots

### Welcome Page
!["Welcome Page"](https://github.com/MichaelBinnick/jungle-rails/blob/master/app/assets/images/Welcome%20Page.png?raw=true)

### Product Cards
!["Product Card"](https://github.com/MichaelBinnick/jungle-rails/blob/master/app/assets/images/Product%20Cards.png?raw=true)
!["Sold Out Badge"](https://github.com/MichaelBinnick/jungle-rails/blob/master/app/assets/images/Dynamic%20Stock%20Status.png?raw=true)

### Product Page
!["Product Page"](https://github.com/MichaelBinnick/jungle-rails/blob/master/app/assets/images/Product%20Page.png?raw=true)

### Admin Controls
!["Dashboard"](https://github.com/MichaelBinnick/jungle-rails/blob/master/app/assets/images/Admin%20Dashboard.png?raw=true)
!["Categories"](https://github.com/MichaelBinnick/jungle-rails/blob/master/app/assets/images/Admin%20Categories.png?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios. Put in a valid expiry date, and anything else can just be 1's.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
