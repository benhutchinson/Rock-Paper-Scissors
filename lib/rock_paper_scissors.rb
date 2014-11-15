require 'sinatra/base'
require_relative 'computer_choice'
require_relative 'winner_logic'


class RockPaperScissors < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views") }

  get '/' do
    erb :index
  end

  post '/registration' do 
    @player_name = params[:player_name]
    erb :game
  end

  post '/result' do 
    @weapon = params[:weapon]
    @computer_choice = ComputerPlayer.new.choice
    Winner.new(@weapon, @computer_choice).the_result_is
    @result = Winner.new(@weapon, @computer_choice).result
    erb :result
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end