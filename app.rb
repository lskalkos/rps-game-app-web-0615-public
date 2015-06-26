require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    # Your app code goes here

    @player_move = params[:play].to_sym
    game = RPSGame.new(@player_move)

    @computer_move = game.computer_play

    @result = game.result

    erb :rps_game
  end

  get '/' do
    "Welcome to Rock, Paper, Scissors!"
  end
end
