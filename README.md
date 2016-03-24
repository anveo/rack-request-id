# Rack::RequestId

Rack middleware which adds a random 16-digit hexidecimal value into an
`X-Request-Id` response header and also into
`Thread.current[:request_id]`.  If you are using a multi-threaded
webserver like [puma](http://puma.io/), see instructions below on how to
safely store the value globally.

## Usage

Add the following to your `Gemfile`.

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

Optionally you can override the ID generation `proc`. By default it's `SecureRandom.hex(16)`.

```ruby
class MyApp < Sinatra::Base
  use Rack::RequestId, id_generator: proc { SecureRandom.random_number(100) }
end
```

Optionally you can also change storage. Storage objects must have `#[]` and `#[]=` method.

```ruby
require 'request_store'

class MyApp < Sinatra::Base
  use Rack::RequestId, storage: RequestStore
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

