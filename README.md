# Becario

Log your redmine hours from a csv file

## Requirements

* Firefox browser
* Ruby >= 2.1.3

## Installation

Install it yourself as:

    $ gem install becario

Install Selenium Standalone with node

    $ npm install selenium-standalone@latest -g
    $ selenium-standalone install
    $ selenium-standalone start
## CSV

Create a csv file with the following format including headers
```csv
date,ticket,hours,comments,activity
```

Example:

```csv
date,ticket,hours,comments,activity
"2016-07-18",20164,".5","Standup meeting","Meeting"
```

1. date: Date to log activity
2. ticket: Ticket's number
3. hours: Number of hours to log
4. comments: Comments to add in the log
5. activity: Activity type, e.g Development, Meeting, Reporting

## Usage

```ruby
require 'becario'

# Set configuration
Becario.redmine_url = 'https://mycompany.logs.com/redmine'
Becario.credentials = {username: 'myUsername', password: 'myPassword'}
Becario.csv = '/path/to/csv/file'

Becario.run
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/becario/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
