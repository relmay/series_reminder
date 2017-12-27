# Series Reminder
[![Gem Version](https://badge.fury.io/rb/series_reminder.svg)](https://badge.fury.io/rb/series_reminder)

## Installation

Install it from rubygems:

    $ gem install series_reminder

Or, get the source and install it:
```
$ git clone https://github.com/relmay/series_reminder
$ bundle install
$ bundle exec rake install
```
## Usage
Go to the directory where the files are located for viewing, and run the following command:

    $ series -n

This command should start playing the next series. If you don't use the mpv videoplayer, then you need to [specify your videoplayer in the config file](https://github.com/relmay/series_reminder/wiki/Configuring#videoplayer-execution-command).

If the standard regular expression does not work with your files, then you can easily fix it by following the [instructions](https://github.com/relmay/series_reminder/wiki/Creating-regular-expressions-for-series_reminder#the-easiest-way-to-write-a-regular-expression).

If you want to set custom regex to search for a file of the specified series in this directory:

**Notice** that `%%SERIES%%` will be replaced with current series

    $ series -r "[eE]%%SERIES%%"

   For more information on creating regular expressions for series_reminder, visit the [wiki page]()

Launching the selected series: 

    $ series -s 5

To show the number of the last viewed series:

    $ series -l

The rest of the functions can be found in the project [wiki](https://github.com/relmay/series_reminder/wiki).

There is also the option of configuring the application. Information about this can be found on the [wiki page](https://github.com/relmay/series_reminder/wiki/config).


## Development

You can run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/relmay/series_reminder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SeriesReminder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/relmay/series_reminder/blob/master/CODE_OF_CONDUCT.md).
