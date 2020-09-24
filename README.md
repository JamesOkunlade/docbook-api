# Docbook -  Rails API

## Introduction

This is a doctors listing and appointment booking API. Similar applications to what Docbook are CureFit, Practo, and Nedmeds.

Specification summary:

- RESTful api.
- Api versioning.
- Booking app .
- Patterns and good practices.
- Users management.
- Secret/token api key.
- Rspec testing.
- Setup scripts.
- Postgres database.
- Json serialization.

## Requirements

- Ruby version 2.6.2

- Rails version 6.0.3

- Postgres

## Installation

- Clone the repository and get inside it:

```
git clone git@github.com:JamesOkunlade/docbook-api.git

cd docbook-api
```

- Install all gems:

```
bundle install
```

- Create a postgres database:

```
rails db:create
```

- Migrate database

```
rails db:migrate
```

- Populate database with seed data

```
rails db:seed
```

- Run tests:

```
rspec
```

- Start the server

```
rails s
```

## Documentation

### Authentication

Authentication is performed using JSON Web Tokens. JSON Web Tokens are an open, industry standard [RFC 7519](https://tools.ietf.org/html/rfc7519) method for representing claims securely between two parties. When the user successfully logs in using their credentials, a JSON Web Token will be returned, which should be kept by clients in
local storage (no cookies):

**Note** Since there is no session information and every call to the REST API requires authentication. Whenever the user wants to access a protected route or resource, the user agent should send the JWT in the Authorization header using the Bearer schema:

`Authorization: Bearer <token>`

The following routes are available for authorization:

- `POST /auth/login`
- `POST /signup`


## Technology Used

- Rails api
- Postgres
- Active model serializers
- bcrypt
- jwt

### API Endpoints

| API Endpoint                      | Functionality                           |
| ----------------------------------| --------------------------------------- |
| POST /signup         | Register a new user                     |
| POST /auth/login                 | Login in a user                         |
| GET /doctors     | Fetches a list of doctors   |
| GET /doctors/:id     | Fetches a doctor by Id   |
| PUT /doctors/:id     | Udates a doctor by Id   |
| DELETE /doctors/:id     | Delets a doctor by Id   |
| POST /doctors  | Creates a doctor   |
| GET /specialities             | Fetches a list of specialitist        |
| POST /specialities                 | creates a speciality                            |
| PUT /specialities/:id                 | Updates a speciality                            |
| DELETE /specialities/:id                 | Deletes a speciality                            |
| GET /appointments                  | Fetches a list of appointments of a user                       |
| POST /appointments                  | Creates an appointment of between a user and a doctor                      |
| PUT /appointments/:id                  | Updates an appointment between a user and a doctor                      |
| POST /appointments/:id                  | Deletes an appointment                      |
| GET /users/:id/appointments         | A user list of appointments|
| GET /users/:id/appointments         | A doctor list of appointments|



## Live Version

This is the link to the api documentation - 
[Docbook-api documentation](https://documenter.getpostman.com/view/10231991/TVKFybRX)<br>

<!-- CONTACT -->

## Author

James Okunlade

- [Github profile](https://github.com/JamesOkunlade)