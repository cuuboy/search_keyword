## How to start

* Install Ruby: https://www.ruby-lang.org/en/documentation/installation/
* Install RSpec:
```shell
gem install rspec
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
