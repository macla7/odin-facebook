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

Environment Variables:
  <ul>
    <li>Seem to have got working the credentials.yml.enc file in config folder. When you use Vscode as an editor, you have to access it a bit of a funky way.. Like so -> "EDITOR="code --wait" bin/rails credentials:edit".</li>
    <li>figured out you have to make it wait, and also just got general help, by this guide <a href="https://blog.saeloun.com/2019/10/10/rails-6-adds-support-for-multi-environment-credentials.html">here</a></li>
    <li>MASSIVE HICCUP: Was taking envs out of .env file, even in production, and then commited this. This made amazon and github wig out at me, for security reasons so fair. I then had to re do ALL my security details and reset them all. <br />
    The challenge with above --> Was that I needed now to properly set my credentials.yml.enc with all the right things, and then call this file correctly. I needed to also make a change to config/environments/production.rb to uncomment 'config.require_master_key = true' according to <a href='https://dev.to/n350071/extractcredentialsprovider-cannot-load-rails-config-activestorage-service-aws-sigv4-errors-missingcredentialserror-4ge7'>this sit</a>. <br />
    Then i had to make sure, wherever I am calling the aws client, be it s3 or SES or whatever, that i was using my new creds (from their new location) which is Rails.application.credentials.aws (or .facebook).<br />
    Now on to Appeas amazon...</li>
  </ul>

  Things to change still:
  <ul>
    <li>DONE -- Clean up likes code, with some clean renders of partials.</li>
    <li>Make sure you don't need to friend yourself, and that you can see your own posts on wall, as well as others posts on their wall...</li>
    <li> Also see you're own posts on feed</li>
  </ul>
