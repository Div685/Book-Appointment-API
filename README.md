![Linter workflow](https://github.com/Div685/Book-Appointment-API/actions/workflows/linters.yml/badge.svg)

# Salon Appointment API built with Ruby on Rails

![Screenshot](/screencapture.png)

## About the Project

This REST API was built with Ruby on Rails, and Postgres for the databases. The main goal for this project was to build a REST API for the Booking appointment App for Salon and that can be used with front-end framework like React. 

This API has 3 database models
- user model
- items model
- appointment model
- To authorize the users, this app uses [JWT](https://jwt.io/) and [Rack-cors](https://github.com/cyu/rack-cors)


## Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [Ruby](https://www.ruby-lang.org/en/)

## Live Demo

[Live Demo Link](https://salonrailsapi.onrender.com/api/v1/items)


## Getting Started

To get a local copy up and running follow these simple example steps.
- [ ] Open your terminal
- [ ]  Navigate to the directory where you will like to install the repo by running `cd FOLDER-NAME` 
- [ ] Clone this repository
 > `git clone https://github.com/Div685/Book-Appointment-API.git`
- [ ] To install all dependencies and necessary gems, run `bundle installl`, `yarn install`
- [ ] Run `rails db:setup`
- [ ] Run `rails server` to run rails application in your local server
- [ ] Run `rspec` to run rspec tests

## How to allow the frontend app to interact with this API
1. Go to puma.rb, located in config/puma.rb, and rewrite the port from 3000 to 3001 like below:
e.g. `port ENV.fetch("PORT") { 3001 }`

2. Go to cors.rb, located in config/initializers, and rewrite the origins path for your frontend path in both local and production


## Authentication

- To manage Appointments and items, user needs to login with a username and a password. Then you need to pass token, which is issued when user logged in, Pass the token in the header like below:
`headers: {
  'Content-Type': 'application/json',
  Authorization: `Bearer ${token}`,
},`
- To manage items, user or administrator needs to log in as a admin.
- To login as a admin Account follow the section below called "How to create admin user".


## How to create admin user

This API administrator can create an admin user through the rails console in the local environment. For example, in the console, run `rails c`, then in the console, you can create an admin user like below:
`User.create(username: 'admin', password: 'admin', admin: true)`

## Author

👤 **Divyesh Patel**

- GitHub: [@Div685](https://github.com/Div685)
- Twitter: [@div_685](https://twitter.com/div_685)
- LinkedIn: [Divyesh Patel](https://www.linkedin.com/in/divyesh-daxa-patel/)

## Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](../../issues).

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Show your support

Give a ⭐️ if you like this project!

## Acknowledgements
* [Ruby on Rails guide](https://guides.rubyonrails.org/api_documentation_guidelines.html)
* [JWT](https://jwt.io/)
* [Rack-cors](https://github.com/cyu/rack-cors)
* [Shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [Rspec-rails](https://github.com/rspec/rspec-rails)
