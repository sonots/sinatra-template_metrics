# Sinatra::TemplateMetrics

Instrument sinatra template rendering

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sinatra-template_metrics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-metrics

## Usage

Just require `sinatra/template_metrics` in addition to `sinatra/base` as:

```ruby
require 'sinatra/base'
require 'sinatra-template_metrics'

class App < Sinatra::Base
  get '/' do
    erb :index, layout: :base
  end
end
```

This will show you the measure time to render erb as:

```
time:2014-11-02T02:39:50+09:00     template:index  layout:base     elapsed:0.002839445
```

where `elapsed` is the elapsed time in seconds.

## See also

* [rack-ltsv_logger](https://github.com/sonots/rack-ltsv_logger) (or `enable :logging`) is useful to instrument http request.
* [mysql2-metrics](https://github.com/sonots/mysql2-metrics) is useful to instrument mysql2 queries. 

## Contributing

1. Fork it ( https://github.com/sonots/sinatra-metrics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
