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
    <li>Typo in my bloody facebook_secret..</li>
    <li>Need to skip the crf token thingo for the devise:userssessionscontroller. -> This I had to make to (along with all the other custom devise controllers), so that I could customise it.</li>
    <li>Needed to take off confirmable as one of the devise modules, as this was running some 'confirm_at' method, which was being a pain.</li>
    <li>Didn't integration test this TDD.. but thinking maybe I should have, as this could have helped me find the errors sooner..</li>
  </ol>

General Notes:
  <ul>
    <li>Did not use TDD/BDD for Like and Comment models as I was following along with a very useful guide <a href='https://medium.com/full-taxx/how-to-add-likes-to-posts-in-rails-e81430101bc2'>here</a> about making these.
    I did however build some model tests for these two afterwards.</li>
    <li>Environment variables set with export ENV in command line for now.</li>
  </ul>

Active Storage:
  <ul>
    <li>Remeber when working with devise, you're going to have to permit the extra attribute for user in the user controller, but also the registrations controller too (I think, at least I did here)..</li>
    <li>Biggest time drain here was I also needed to sanitise the extra attribute in the application controller.. Without doing this I don't think it was leting the avatar same properly...</li>
    <li> ALSO: was trying to understand the resize_to_limit method that the image processing gem can use but fuck, whatever is going on here i have no idea. installed some massive package via 'brew install imagemagick vips' and cancelled half way through. But now this method seems to be working.. Need to find out how what when why. Investigate homebrew more</li>
  </ul>
