require 'sinatra/base'
require_relative 'lib/player'
class Battle < Sinatra::Base

  set :sessions, true

  # use Rack::Session::Cookie, :key => 'rack.session',
  #                            :path => '/',
  #                            :secret => 'your_secret'

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:name_player_one])
    $player_2 = Player.new(params[:name_player_two])
    redirect '/play'
  end

  get '/play' do
    @p2_HP = 100
    erb :play
  end

  get '/attack' do
    erb :attack
  end

  run! if app_file == $0

end
