# Secret Santa Script

This is a simple Ruby script for assigning secret Santas and emailing everyone their assignment. The basic rule is that nobody can be assigned to give a gift to someone in their own group (including, of course, themselves). In my family, group == household, but it could mean anything you like.

The script uses Dennis Ranke's solution from [The Ruby Quiz #2](http://www.rubyquiz.com/quiz2.html), which gives everyone a correct assignment in a single pass through the list. Nice! :) The only tweaks I made were practical ones, like using config files, and a tiny bit of refactoring, logging, etc, to make it more apparent what's happening.

## Usage

- Clone the repo
- Copy each of the `.yml.example` files in `config/` to a corresponding `.yml` and customize.
  - Security note: this script uses TLS to connect to your email account. If you're sending via a Gmail account, you can create a temporary password for this script at [https://security.google.com/settings/security/apppasswords](https://security.google.com/settings/security/apppasswords) and revoke it when you're done.
- Run `ruby secret_santa.rb` and examine the output
- When you're satisfied, run `REALLY_SENDING=true ruby secret_santa.rb`

## Dependencies

None, other than Ruby (I've used it with 1.9 and 2.2.3) and the standard library.

## Thanks

Thanks to Dennis Ranke for a nice solution, and to James Edward Gray II for running The Ruby Quiz.
