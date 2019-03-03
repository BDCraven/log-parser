# log-parser

A ruby script that:

1. Receives a log as an argument (webserver.log) e.g.: `./parser.rb webserver.logic`

2. Returns the following:

list of webpages with most views ordered from most page views to less page views
```
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
```

list of webpages with most unique views also ordered
```
/index 23 unique views
/home 23 unique views
/contact 23 unique views
/help_page/1 23 unique views
/about/2 22 unique views
/about 21 unique views
```

### Tech

Written in Ruby and tested with RSpec.


### How to use

1. `git clone https://github.com/BDCraven/log-parser.git`
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Run the tests with `rspec`
5. View the output of the test log with `ruby bin/parser lib/webserver.log`

### Approach to the challenge

I started the challenge by considering the basic structure of the code and classes. I loosely formed the view that I would need a reader, counter, sorter and formatter. In the end I opted to read the file from the command line using AGRF as I wanted a neat way to run the app from the command line. I also saved the `webserver.log` in the lib directory for convenience when running and feature testing the output.

I then incorporated a basic validator to check the log file was in roughly the right format. The validator also splits the data into lines. I had originally planned to have the reader as a separate object but as part of the validation was to split the data into lines I decided it was ok to leave this to the validator for now.

I implemented a counter to create a hash of the webpages counting the number of ip_addresses per webpage. The results are used to calculate the total views per page and the total unique views per page. I interpreted unique views as meaning at least one view per ip_address so I totalled the number of unique ip_addresses for each webpage.

Finally, I sorted the data and printed the results to the terminal using the parser_formatter.

### Areas for improvement

Validation is currently only checking that the data can be split into lines and that each line contains two elements. I would want to improve this, perhaps by adding some regex to check the data looks like a log file.

Testing could be improved as it is currently mainly testing the happy path. It would benefit from additional testing of the sad path.

Naming of the various classes could potentially be improved to aid readability.
