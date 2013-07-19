require 'rubygems'
require 'rspec'
require 'rack'
require 'rack/test'
require 'sinatra/base'

$:.push(File.expand_path(File.dirname(__FILE__)))
$:.push(File.expand_path(File.dirname(__FILE__)) + '/../lib')

require 'rack-request-id'
