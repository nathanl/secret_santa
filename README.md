# Secret Santa Script

This is a Ruby script for assigning secret Santas and emailing everyone their assignment. The basic rule is that nobody can be assigned to give a gift to someone outside their own group (including, of course, themselves). In my family, group == household, but it could mean anything you like.

The script uses Dennis Ranke's solution from [The Ruby Quiz #2](http://www.rubyquiz.com/quiz2.html), which gives everyone a correct assignment in just a few passes through the list. Nice! :) The only tweaks I[nathanl] made were practical ones, like using config files, and a tiny bit of refactoring, logging, etc, to make it more apparent what's happening.

I further made changes to the supporting files and added complications like mailgun support, configuration with Dotenv, and some debugging tools. 

## Usage

- Clone the repo
- Copy each of the `.yml.example` files in `config/` to a corresponding `.yml` and customize.
- Copy dotenv.sample to .env with `cp dotenv.sample .env` and make your config changes.
  - Security note: don't commit .env file or actual secrets to dotenv.sample
- Run `ruby ./bin/secret_santa.rb` and examine the output
- Modify `letter_template.erb`, if you like, and repeat.
- When you're satisfied, run `REALLY_SENDING=true ruby ./bin/secret_santa.rb` or adjust REALLY_SENDING in the .env file.

## Dependencies

See the Gemfile for a complete list of dependencies. 

## Thanks

Thanks to Dennis Ranke for a nice solution, and to James Edward Gray II for running The Ruby Quiz, and to Nathan Long for the inspiration and implementation. 

## TODO

- more tests


