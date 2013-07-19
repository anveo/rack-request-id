require 'spec_helper'

module SinatraSpec

  class TestApp < Sinatra::Base
    use Rack::RequestId
    get('/') { status(200) }
  end

  describe Rack::RequestId do
    include Rack::Test::Methods

    let(:app) { TestApp.new }

    it 'adds an X-Request-Id header to the response' do
      get '/'
      expect(last_response["X-Request-Id"]).to_not be_nil
    end
  end
end
