# README

This project follows The Odin Project's Rails Final Project instructions available at https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project

This project uses Rails version 7.1.3.2 with Devise version 4.9.

Notes: I have not before had Devise working with a Mailer to send emails, so I have chosen not to use the 'Recoverable' module, in order that 'Confirmable' is the only module that sends emails, to confirm the creating of an account. My list of Devise modules to use is:

Database_Authenticatable, Registerable, Confirmable,
         Rememberable and Validatable.

-----------------

One significant problem has been trying to get the posts#show or posts#index page to update automatically when a new comment is added to a post. I have used Turbo Frames to generate the comments#new form within the display_post partial, but redirecting from the CommentsController was not working until I discovered this solution: 
https://discuss.hotwired.dev/t/how-to-redirect-from-a-form-that-is-inside-a-turbo-frame/4164
By adding the Stimulus Javascript controller form_redirect_controller.js and adding data-controller and data-action attributes to the form_with in comments#new, the redirect_back command in the CommentsController updates the current page with the new comment, as intended.

I have decided not to send real emails, due to the difficulties of making an account with a sender as a private individual (as opposed to an organisation).
There have been bugs upon deployment due to my inexperience with secrets/tokens.


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
