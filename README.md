# Resorts System: A Relational Rails Project 

This project is a relational Rails app completed by Kerri Hoffmann and Hannah Warren during the course of Module 2 of our Backend Engineering program at Turing School of Software and Design. 

## About

Ruby version: 2.7.2
Rails version: 2.5.6

## Instructions to Run

Ensure you have the correct versions of both Ruby and Rails installed. 

Clone this repo. 

Install the repo's dependencies with
```bundle install```

Then create your local database with
```
rake db:create
rake db:seed
```
Run the rails server with 
```
rails server
```
And visit localhost:3000 to look around! 

### App database schema:
![database schema with two tables](https://github.com/kbhoffmann/resorts_system/blob/main/db-schema-relational-rails.png) 

## How to run the test suite
``` bundle exec rspec ```
