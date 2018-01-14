## How to start

* Install Ruby: https://www.ruby-lang.org/en/documentation/installation/
* Install RSpec:
```shell
gem install rspec
```

## How to use it

* Obtain this code into your project and call SearchService, SearchRecord must be visible from SearchService.
* Example:
```ruby
records = SearchService.new('fixtures/projects.json').find!('example')
```
and your should be able to get records with this contain:
```ruby
#<SearchRecord:0x007fb06a159ba0
  @path=["The 1 Element", "At attribute \"url\"", "http://example.com/projects-1"]>
```
If you want to get the report string:
```ruby
puts record.result
# Found at: The 1 Element > At attribute url > http://example.com/projects-1
```

## How to Run The Test

* RSpec is required
Simply go to your terminal and run
```shell
rspec search_service_spec.rb
```

## How It Works

* It uses the JSON package from Ruby library
* Once got parsed JSON object, SearchService will run a recursive check, which is implemented by SearchService.dig_find.
* At the buttom of the layer, call string.includes? to perform the search.

## What Needs To Be Improved

* Recursive isn't a ideal way to implement a scalable module.

## System Configs

#### Ruby version:

Developed in ruby 2.3.3p222
