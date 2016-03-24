require 'securerandom'

module Rack
  class RequestId
    def initialize(app, opts = {})
      @app = app
      @storage = opts[:storage] || proc { Thread.current }
    end

    def call(env)
      storage = @storage.respond_to?(:call) ? @storage.call : @storage
      storage[:request_id] = env['HTTP_X_REQUEST_ID'] || SecureRandom.hex(16)
      status, headers, body = @app.call(env)
      headers['X-Request-Id'] ||= storage[:request_id]
      [status, headers, body]
    end
  end
end
