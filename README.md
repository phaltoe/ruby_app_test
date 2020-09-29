# Command Line Log Parser

This is a command line program which accepts an Log File and a parses it outputting the most viewed paths and the number of unique views for each path.

## How To Run

This program was written with:

    ruby 2.7.1
  
If you don't have it installed, please visit [https://www.ruby-lang.org/en/documentation/installation/](https://www.ruby-lang.org/en/documentation/installation/)and follow installation instructions.

In order to run the program:

```
git clone git@github.com:phaltoe/ruby_app_test.git
cd into /ruby_app/test
gem install bundler
bundle install
```

##### To Run The Script
```ruby
run
$ ruby  parser.rb  webserver.log
```
##### To Run The Tests
```ruby
$ rspec
```


## Design Decisions

Following the instructions, I created this script following TDD principles and OOD. Codebase was fully tested and are considering several edge-cases as explained below:

## Edge Cases

`bad_ip_sample.log | bad_log_sample.log | log_sample.log`  were created to test different edge scenarios as specified below:

**1. If no path is provided** - line will be skipped to the next<br />
**2. If no ip is provided** - line will be skipped to the next<br />
**3. If no path or ip is provided** - line will be skipped to the next<br />
**4. If path has forbidden path characters** - line will be skipped to the next<br />
**5. If ip is not a valid IP Address**  - line will be skipped to the next<br />
**6. If ip is not a valid IPv4 Address** - line will be skipped to the next<br />
**7. If no LogFile is provided** - an error will be raised<br />
**8. If LogFile has a bad path** - an error will be raised<br />

Edge cases were considered during the parsing to make sure only well-formatted data inputs the script. Please notice that in the case of bad-formatted ip or path, no log is being generated. However, in a real case scenario this should be notifying the team through an email or other media.


------------

# Ruby Developer Test

Before you start coding (and let’s be honest, we know that’s what you want to do), please read the following.


Firstly, the test should take you no more than 2.5 hours to complete.


Secondly, the test is for us to see how you code and the methodologies you use, what we will be looking for in this test are the following:


● __Functionality__

● __Efficiency__ – We like clean, simple code.

● __Readability__

● __Tests__ (we have 96% test coverage in our code and we aim to keep it that way).

_Also, we would like to understand your ability to use __TDD__ and __OO__, so please ensure
these are part of your complete test. This is your chance to show us what you can do,
so use it to show us how you design and code! Feel free to submit your solution as a link to your version control repository
The test is as follows:_


## ruby_app

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log

b. Returns the following:

list of webpages with most page views ordered from most pages views to less page views 
e.g.:
> /home 90 visits /index 80 visits etc... > list of webpages with most unique page views also ordered

e.g.:

> /about/2 8 unique views /index 5 unique views etc...

Finally, have some fun – Feel free to make changes or design something if you think it meets the criteria above, but would produce better outcomes and of course, the sooner you return the test, the quicker we can move the process.


