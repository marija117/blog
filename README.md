# README

This README document steps are necessary to get the application up and running.

Things you may want to cover:

* Ruby version 
  `ruby 2.7.6`

* Rails version 
  `Rails 7.0.3`

* After cloning the project it is necessary to do
  `bundle install`

* If is not already installed, it is necessary to install mysql
  `brew install mysql`
  `brew services start mysql@5.6`

* It is necessary to create a database in mysql terminal

  1. Log into MySQL as root:
    `mysql -u root` 

  2. Create new database user with password and grant him all privilages
    `GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost' IDENTIFIED BY 'secret';`

  3. Log out of MySQL by typing: \q.

  4. Log in as the new database user you just created:
    `mysql -u user -p`

  5. Create a new database:
    `CREATE DATABASE blog;`

* It is neccesary to create .env file with following content:
  `MYSQL_HOST=127.0.0.1`
  `MYSQL_DATABASE=blog`
  `MYSQL_USER=user`
  `MYSQL_PASSWORD=secret`

* After that run these commands 
  `rails db:create`
  `rails db:migrate`
  `rails db:seed`

* For this project bootstrap via importmap is used for style
  1. To check if you already have importmap
    `cat config/importmap.rb`
  2. To install importmap in Rails7
    `rails importmap:install`

* ActionCable and Turbo with redis server are used for real-time updates. If is not already installed, it is necessary to install turbo and redis
  1. To install turbo
    `rails turbo:install`
  2. To install redis
    `brew install redis`
  3. Changes the development Action Cable adapter from Async (the default one) to Redis
    `rails turbo:install:redis`

* To start the redis server
  `redis-server`

* How to run the test suite
  `Example: bundle exec rspec ./spec/models/post_spec.rb`
  `Example: bundle exec rspec ./spec/models/comment_spec.rb`
  `Example: bundle exec rspec ./spec/models/reaction_spec.rb`

# blog
