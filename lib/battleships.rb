require 'sinatra/base'
require_relative 'player'

class BattleShips < Sinatra::Base
  enable :sessions

  get '/' do
    @player = Player.new
    session[:player1_id] = @player.object_id
    erb :index
  end

  get '/hit' do
    @player = Player.get_player(session[:player1_id])
    erb :game
  end

  get '/new_game' do
    "What's your name?"
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
