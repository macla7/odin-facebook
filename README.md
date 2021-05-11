# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Omniauth:
Ran into many.. many errors with omniauth and devise. Some of the big time killers:
  <ol>
    <li>1. Typo in my bloody facebook_secret..</li>
    <li>2. Need to skip the crf token thingo for the devise:userssessionscontroller. -> This I had to make to (along with all the other custom devise controllers), so that I could customise it.</li>
    <li>3. Needed to take off confirmable as one of the devise modules, as this was running some 'confirm_at' method, which was being a pain.</li>
    <li>4. Didn't integration test this TDD.. but thinking maybe I should have, as this could have helped me find the errors sooner..</li>
  </ol>

General Notes:
  <ul>
    <li>Did not use TDD/BDD for Like and Comment models as I was following along with a very useful guide <a href='https://medium.com/full-taxx/how-to-add-likes-to-posts-in-rails-e81430101bc2'>here</a> about making these.
    I did however build some model tests for these two afterwards.</li>

    <li>Environment variables set with export ENV in command line for now.</li>
  </ul>
