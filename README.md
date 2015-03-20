# Api Explorer

## Database

1. Install Postgres 9.x

2. Create apiexplorer_development and apiexplorer_test databases

3. Run `rake db:seeds` to get the basic set of data

## RSpec

* Feature specs run headlessly using the Poltergeist driver for Capybara, which requires PhantomJS. Installing it via Homebrew is probably the easiest way to get it up and running.
