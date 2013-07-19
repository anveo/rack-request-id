require 'securerandom'

module Rack
  class RequestId
    def initialize(app)
      @app = app
    end

    def call(env)
      Thread.current[:request_id] = env['HTTP_X_REQUEST_ID'] || SecureRandom.hex(16)
      status, headers, body = @app.call(env)
      headers['X-Request-Id'] ||= Thread.current[:request_id]
      [status, headers, body]
    end
  end
end
