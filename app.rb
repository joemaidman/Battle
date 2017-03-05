require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base

  set :sessions, true

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @game = Game.create(Player.new(params[:name_player_one]), Player.new(params[:name_player_two]))
    redirect '/play'
  end

  get '/play' do
    @game.change_player
    erb :play
  end

  get '/attack' do
    @game.attack(@game.opponent_of(@game.current_player))
    erb(:attack)
  end

  get '/sleep' do
    @game.sleepy
    erb(:sleep)
  end

  get '/poison' do
    @game.poison(@game.opponent_of(@game.current_player))
    erb(:poison)
  end

  get '/force' do
    @game.force
    erb :force
  end

  get '/heal' do
    @game.heal(@game.current_player)
    erb(:heal)
  end
  # start the server if ruby file executed directly
  run! if app_file == $0

end
