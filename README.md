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

Generate an API application with Rails 5
Setup RSpec testing framework with Factory Bot, Database Cleaner, Shoulda Matchers and Faker.
Build models and controllers with TDD (Test Driven Development).

## Screenshots
![Example screenshot](./img/screenshot.png)

## Technologies
* Ruby on Rails 5

## Setup

```ruby
bundle install

```

## Code Examples

Request specs are designed to drive behavior through the full stack, including routing. This means they can hit the applications' HTTP endpoints as opposed to controller specs which call methods directly. Since we're building an API application, this is exactly the kind of behavior we want from our tests.

> According to RSpec, the official recommendation of the Rails team and the RSpec core team is to write request specs instead.


```ruby
# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  # initialize test data 
  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }

  # Test suite for GET /todos
  describe 'GET /todos' do
    # make HTTP get request before each example
    before { get '/todos' }

    it 'returns todos' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /todos/:id' do
    before { get "/todos/#{todo_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:todo_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  # Test suite for POST /todos
  describe 'POST /todos' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/todos', params: valid_attributes }

      it 'creates a todo' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    # [...]
```

## Features
List of features ready and TODOs for future development
* rspec tests
* TDD to implement the todo API
*  JWT (gem name)
* [httpie](https://httpie.org/doc#installation) - Make HTTP requests to an API with httpie
* [token based authentication](https://stackoverflow.com/questions/1592534/what-is-token-based-authentication)

 Created authentication system by adding the following service classes:

* JsonWebToken - Encode and decode jwt tokens
* AuthorizeApiRequest - Authorize each API request
* AuthenticateUser - Authenticate users
* AuthenticationController - Orchestrate authentication process

#### About JsonWebToken

Our class will live in the ```lib``` directory since it's not domain specific; if we were to move it to a different application it should work with minimal configuration. There's a small caveat, though...

> As of Rails 5, [autoloading is disabled in production](http://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html#autoloading-is-disabled-after-booting-in-the-production-environment) because of thread safety.

This is a huge concern for us since lib is part of auto-load paths. To counter this change, we'll add our lib in app since all code in app is auto-loaded in development and eager-loaded in production. [Here's a long discussion](https://github.com/rails/rails/issues/131420)

To-do list:
* Continue this project!

## Status
Project is: _in progress_

## Inspiration
Project based on [scotch.io tutorial](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-three)

## Contact
Created by [@lapinskap](https://www.facebook.com/paulina.lapinska99) - feel free to contact me!
