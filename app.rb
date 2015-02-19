require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'better_errors'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

get '/' do
  redirect '/index'
end

get '/index' do
  erb :index
end