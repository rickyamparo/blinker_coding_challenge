# Blinker Coding Challenge
Ruby on Rails API for Blinker.

### Assignment
This assignment was completed as part of a technical interview for Blinker inc.  The Assignment is as follows:

Create a RESTful JSON Rails API that models vehicles.
The API endpoints should allow for vehicles, makes, models, & options to be listed, added, updated, deleted & associated to each other.

Please document your endpoints fully.

### Technologies used
Framework - Ruby on Rails
* Rails 5.1.4 [link to docs](http://rubyonrails.org/)
* ruby 2.3.1 [link to docs](https://www.ruby-lang.org/en/)

Gems
 * pry [link to docs](https://rubygems.org/gems/pry)
 * rspec-rails [link to docs](https://rubygems.org/gems/rspec-rails)
 * simplecov [link to docs](https://rubygems.org/gems/simplecov)
 * factory_bot_rails [link to docs](https://rubygems.org/gems/factory_bot_rails)
 * shoulda-matchers [link to docs](https://rubygems.org/gems/shoulda-matchers)
 * database_cleaner [link to docs](https://rubygems.org/gems/database_cleaner)


### Setup Instructions
1. clone the repo to your local machine.
2. run `bundle` to intsall your gems.
3. run `rake db:create db:migrate db:seed` to create your database.

To start your server, run `rails server` in your command line.


### Production
[Heroku App](https://vast-wildwood-58678.herokuapp.com/)

### API Endpoints

You can visit any of the routes in our application and view them from your browser by navigating to the heroku hosted app, or localhost:3000 if using `rails server`. To view the JSON in a human readable way, it is recommended that you download a Google chrome plugin, or alternatively, view the JSON endpoints in Firefox, which makes JSON human readable by default.

A full listing of the routes in our application can be found below:

<table>
  <tr>
    <th>URI</th>
    <th>HTTP Verb</th>
    <th>Controller#Action</th>
  </tr>
  <tr>
    <td colspan="3">Vehicle Endpoints</td>
  </tr>
  <tr>
    <td>/api/v1/vehicles</td>
    <td>GET</td>
    <td>api/v1/vehicles#index</td>
  </tr>
  <tr>
    <td>/api/v1/vehicles/:id</td>
    <td>GET</td>
    <td>api/v1/vehicles#show</td>
  </tr>
  <tr>
    <td>/api/v1/vehicles</td>
    <td>POST</td>
    <td>api/v1/vehicles#create</td>
  </tr>
  <tr>
    <td>/api/v1/vehicles/:id</td>
    <td>PUT</td>
    <td>api/v1/vehicles#update</td>
  </tr>
  <tr>
    <td>/api/v1/vehicles/:id</td>
    <td>DELETE</td>
    <td>api/v1/vehicles#destroy</td>
  </tr>
  <tr>
    <td colspan="3">Option Endpoints</td>
  </tr>
  <tr>
    <td>/api/v1/options</td>
    <td>GET</td>
    <td>api/v1/options#index</td>
  </tr>
  <tr>
    <td>/api/v1/options/:id</td>
    <td>GET</td>
    <td>api/v1/options#show</td>
  </tr>
  <tr>
    <td>/api/v1/options</td>
    <td>POST</td>
    <td>api/v1/options#create</td>
  </tr>
  <tr>
    <td>/api/v1/options/:id</td>
    <td>PUT</td>
    <td>api/v1/options#update</td>
  </tr>
  <tr>
    <td>/api/v1/options/:id</td>
    <td>DELETE</td>
    <td>api/v1/options#destroy</td>
  </tr>
  <tr>
    <td colspan="3">VehiclesOption Endpoints</td>
  </tr>
  <tr>
    <td colspan="3">These endpoints are used for creating associations between Vehicles and Options</td>
  </tr>
  <tr>
    <td>/api/v1/vehicles_options</td>
    <td>POST</td>
    <td>api/v1/vehicles_options#create</td>
  </tr>
  <tr>
    <td>/api/v1/vehicles_options/:id</td>
    <td>DELETE</td>
    <td>api/v1/vehicles_options#destroy</td>
  </tr>
</table>


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
