require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sinatra/activerecord'
require './models/artists'
require 'better_errors'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

# ============= GET ============= #

get '/' do
  redirect '/artists'
end

get '/artists' do
  @artists = Artist.all
  erb :index
end

get '/artists/new' do
  erb :new_artist
end

get '/artists/:id' do
  @artist = Artist.find params[:id]
  erb :show_artist
end

get '/artists/:id/edit' do
  @artist = Artist.find params[:id]
  erb :edit_artist
end

# ============= POST ============= #

post '/artists' do
  @artist = Artist.create params
  redirect '/artists'
end

# ============= PUT ============= #

put '/artists/:id' do
  artist = Artist.find(params[:id])
  artist.update name: params[:name]
  redirect '/artists'
end

# ============= DELETE ============= #

delete '/artists/:id' do
  artist = Artist.find(params[:id])
  artist.destroy
  redirect '/artists'
end