# RUBY ON RAILS AS AN API

This repository contains all data for the front-end to work. Seed data, routes, serializers, and controllers for fetches to work. 

### Features

<li> Building linear direction on the realationships and model associations with Serializers. </li>
<li> Active Record Associations with has_many, belongs_to, and has_many throught

### Tech Stacks

<li> Ruby on Rails '2.6.1'</li>
<li> Rails as an API </li>
<li> PostgreSQL </li>
<li> Active Record </li>

### Gems 
<li> rack-rocks </li>
<li> active_model_serializers </li>
<li> stripe </li>
<li> jwt </li>
<li> bcrypt </li>
  
### Build Status 

Work in Progress

### Setup for running this application 

This repository serves only as the database for the <a href='https://github.com/fbado66/Mod5_frontEnd'>Foodies Road </a> repository labeled as Mod5_frontEnd <br/>
  For the data to get seeded, you need to have your own Zomato API, and adjust the seed file to have access to the key <br/>
  You can find information about getting your API <a href= 'https://developers.zomato.com/api' > here </a>
  
  <li> Clone this repository into your local computer </li>
  <li> cd into the repository you just cloned and run bundle install in the command line to ensure all the gems are set in your local system </li>
  <li> run the next commands: <strong> rails db:create <br/> rails db:migrate <br/> rails db:seed </strong>
  <li> The last step will be to run 'rails s' in the command line to deploy the server in test mode in your local computer
