# Blinker Coding Challenge
Ruby on Rails API for Blinker.

### Assignment
This assignment was completed as part of a technical interview for Blinker inc.  The Assignment is as follows:

Create a RESTful JSON Rails API that models vehicles.
The API endpoints should allow for vehicles, makes, models, & options to be listed, added, updated, deleted & associated to each other.

Please document your endpoints fully.

### Technologies used
Framework - Ruby on Rails
* Rails 5.1.4 [docs](http://rubyonrails.org/)
* ruby 2.3.1 [docs](https://www.ruby-lang.org/en/)
* PostgreSQL 9.6.4 [docs](https://www.postgresql.org/docs/9.6/static/index.html)

Gems
 * pry [docs](https://rubygems.org/gems/pry)
 * rspec-rails [docs](https://rubygems.org/gems/rspec-rails)
 * simplecov [docs](https://rubygems.org/gems/simplecov)
 * factory_bot_rails [docs](https://rubygems.org/gems/factory_bot_rails)
 * shoulda-matchers [docs](https://rubygems.org/gems/shoulda-matchers)
 * database_cleaner [docs](https://rubygems.org/gems/database_cleaner)


### Setup Instructions
1. clone the repo to your local machine.
2. run `bundle` to intsall your gems.
3. run `rake db:create db:migrate db:seed` to create your database.

To start your server, run `rails server` in your command line.

### Test Suite
The test suite was built through a combination of RSpec, Shoula-Matchers, Factory Bot Rails, and Database Cleaner.

To run the test suite: while in the project directory, enter `rspec`.

SimpleCov Coverage [Report](https://htmlpreview.github.io/?https://github.com/rickyamparo/blinker_coding_challenge/blob/master/coverage/index.html#_AllFiles)

### Production
[Heroku App](https://vast-wildwood-58678.herokuapp.com/)

### API Endpoints

You can visit any of the routes in our application and view them from your browser by navigating to the heroku hosted app, or localhost:3000 if using `rails server`. To view the JSON in a human readable way, it is recommended that you download a Google chrome plugin, or alternatively, view the JSON endpoints in Firefox, which makes JSON human readable by default.


A full listing of the routes in our application can be found below.

For a detailed explanation of each endpoint visit the hosted app's [root page]() for more information.


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


### Notes

I initially started working on this project with only one table in my database. I decided to try something new in how I approached the `options` attribute of the vehicle model. I ended up setting that field as a PostgreSQL [Array](https://www.postgresql.org/docs/9.6/static/functions-array.html) datatype. It was definitely an interesting learning experience as I have never used arrays in databases before. While I was able to get it working, I did notice a few pain areas that muddled my code.

The first was the fact that I couldn't include the options in my strong params. Since params are sent in text format, I couldn't use strong params while simultaneously massaging the options params into an array.

Secondly, it made my controller actions a bit to large since I had to create a nil guard for when there were no options params.

Finally it made it difficult to actually interact with a vehicle record's options value.

I decided to refactor my database and follow a more conventional approach, which was to create a many-to-many relationship between options and vehicles. VehiclesOption represent the association between vehicles and options, and is the model for the joins records.

I wanted to use faker, however the faker car information was sorely lacking. You could only use it to create Vehicle Identification Numbers and Manufacturers. It is one of my goals to submit a PR to faker to expand their vehicle information with make, model and options.

In the end I created constants with set car information.
