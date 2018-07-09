# todos-api
> Ruby On Rails 5 Application with REST API 

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Status](#status)
* [Inspiration](#inspiration)
* [Contact](#contact)

## General info
The main objective: Generate an API-only Rails application, set up a test framework, use TDD to implement the todo API, add token-based authentication with JWT, version this API, serialize with active model serializers, and add pagination features.

## Screenshots
![Example screenshot](./img/screenshot.png)

## Technologies
* Ruby on Rails 5

## Setup

```ruby
bundle install

```

## Code Examples

```ruby
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

```
## Features
List of features ready and TODOs for future development
* rspec tests
* TDD to implement the todo API
*  JWT

To-do list:
* Continue this project!

## Status
Project is: _in progress_

## Inspiration
Add here credits. Project inspired by..., based on...

## Contact
Created by [@lapinskap](https://www.facebook.com/paulina.lapinska99) - feel free to contact me!
