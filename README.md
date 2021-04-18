# chuck norris API wrapper

App to consume some endpoints of the chuck Norris API https://api.chucknorris.io.

### Dependencies

Ruby and Rails were installed locally.

- Ruby version. 2.7.0
- Rails version. 5.2.5
- Database Mysql 5.7 (Run in a Docker container)

### Installation

We need first to clone the repo and then follow the steps to get the full app and DB running in containers.

1. `bundle install`
2. Setup of the database
   `rails db:create db:migrate`
3. Run server `rails s`.

### DB Modelling

**Search** - only model used to hold the data returned from the API + data used in the searh form by the user

### Usage

There is a common endpoint to both the GET and POST actions required.  
GET will get the plain index.  
POST will be used to send the form.

In the `routes.rb` file the different routes of the project can be seen in detail.  
Translations have been added in the URL params.  
There are 2 endpoints

        GET /searches    Triggered the first time we get to the page
        POST /searches   To send the user form

Usage is pretty straightforward

![](https://user-images.githubusercontent.com/13310108/115160899-daba9200-a09a-11eb-8d0c-c0a1bf1c9033.png)

### Testing ⛑️

Didn't get time to add a single test 😢

#### How would you improve your solution? What would be the next steps? 💡

- Adding tests.
- Refactoring.
- Looking deeper into the strange issues I faced with the `will-paginate` GEM.
- Spending more time using latest versions of Rails..
