# Rack::RequestId

Rack middleware which adds a 16-digit hexidecimal `X-Request-Id` header
to the response and into `Thread.current[:request_id]`

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

