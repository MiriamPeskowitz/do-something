# Do-Something

## Description
A Sinatra app that lets a user keep track of daily community/political actions. Because it's easy to lose track of how things add up. For more info, see https://miriampeskowitz.github.io/do-something_a_sinatra_app

## File Structure
.
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── futures_controller.rb
│   │   ├── things_controller.rb
│   │   └── users_controller.rb
│   ├── helpers
│   ├── models
│   │   ├── future.rb
│   │   ├── thing.rb
│   │   └── user.rb
│   ├── notes.md
│   └── views
│       ├── layout.erb
│       ├── things
│       │   ├── edit.erb
│       │   ├── index.erb
│       │   ├── new.erb
│       │   └── show.erb
│       ├── users
│       │   ├── goodbye.erb
│       │   ├── login.erb
│       │   ├── show.erb
│       │   └── signup.erb
│       └── welcome.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   │   ├── 20180413203306_create_users_table.rb
│   │   ├── 20180413203322_create_things_table.rb
│   │   ├── 20180416175735_change_column_type_on_things.rb
│   │   ├── 20180416233628_delete_userid_column_in_users_table.rb
│   │   ├── 20180416234714_create_future_acts_table.rb
│   │   ├── 20180418171817_drop_future_acts.rb
│   │   └── 20180418172138_create_futures_table.rb
│   ├── schema.rb
│   └── seeds.rb
├── lib
├── public
│   ├── images
│   │   └── corneal-small.png
│   ├── javascripts
│   └── stylesheets
│       └── main.css
├── spec (NOT YET OPERATIONAL)
│   ├── application_controller_spec.rb
│   ├── future_controller_spec.rb
│   ├── spec_helper.rb
│   └── users_controller_spec.rb
└── spec.md



## Instructions/Install 

URL coming soon. Until then it can be forked and run on localhost. 

## Contributors Guide 
Want to contribute? Send me some Github issues, whether it's bugs you've found (and how you found them), design/UX/UI features that can make DoSomethingNow easier to use.  

## Next features: 
	-- A way to share on Twitter, etc. 
	-- A 3-item to-do list where a user can store the next few things they want to do.
	

## MIT License
Copyright 2018 <COPYRIGHT HOLDER>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
