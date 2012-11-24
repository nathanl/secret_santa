# Secret Santa Script

This is a simple Ruby script for assigning secret Santas and emailing everyone their assignment.

The script uses Dennis Ranke's solution from [The Ruby Quiz #2](www.rubyquiz.com/quiz2.html), which gives everyone a correct assignment in a single pass through the list. Nice! :) The only tweaks I made were practical ones, like using config files, and a tiny bit of refactoring, logging, etc, to make it more apparent what's happening.

## Usage

- Clone the repo
- Copy each of the `.yml.example` files in `config/` to a corresponding `.yml` and customize
- Run `ruby secret_santa.rb` and examine the output
- When you're satisfied, set `REALLY_SENDING` to `true` and run it again

## Dependencies

None, other than Ruby (I tested on 1.9) and the standard library.

## Thanks

Thanks to Dennis Ranke for a nice solution, and to James Edward Gray II for running The Ruby Quiz.
