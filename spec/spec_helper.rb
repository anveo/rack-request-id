require 'rubygems'
require 'rspec'
require 'rack'
require 'rack/test'
require 'sinatra/base'

$:.push(File.expand_path(File.dirname(__FILE__)))
$:.push(File.expand_path(File.dirname(__FILE__)) + '/../lib')

require 'rack-request-id'

class MyStorage
  class << self
    def [](k)
      storage[k]
    end

    def []=(k, v)
      storage[k] =v
    end

    private

    def storage
      Thread.current[:my_storage] ||= {}
    end
  end
end
