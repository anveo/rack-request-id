# Rack::RequestId

Rack middleware which adds a 16-digit hexidecimal `X-Request-Id` header to the response.

## Usage

```ruby
gem 'rack-request-id'
```

#### Sinatra

```ruby
class MyApp < Sinatra::Base
  use Rack::RequestId
end
```

#### Rails

```ruby
module MyApp
  class Application < Rails::Application
    # ...
    config.middleware.use "Rack::RequestId"
  end
end
```

## Configuration

TODO: proc option to override id format

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
