require 'sinatra/base'

class Battle < Sinatra::Base
  set :sessions, true

  get '/' do
    erb(:index)
  end

  post '/names' do
    session['p1_name'] = params[:name_player_one]
    session['p2_name'] = params[:name_player_two]
    redirect '/play'
  end

  get '/play' do

  @p1_name = session[:p1_name]
  @p2_name = session[:p2_name]
  @p2_HP = 100
  erb :play
  end

  run! if app_file == $0

end
