require 'sinatra/base'
require_relative 'computer_choice'
require_relative 'winner_logic'
require_relative 'player'


class RockPaperScissors < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views") }
  enable :sessions

  PLAYERS = []
  WEAPONS = []

  get '/' do
    erb :index
  end

  post '/registration' do 
    @player_name = params[:player_name]
    session[:opponent] = params[:opponent]
    session[:my_name] = @player_name
    erb :game
  end

  post '/result' do 
    if session[:opponent]== "Computer"
      @weapon = params[:weapon]
      @computer_choice = ComputerPlayer.new.choice
      game = Winner.new(@weapon, @computer_choice)
      game.the_result_is
      @result = game.result
      erb :result
    else 
      session[:me] = Player.new(session[:my_name], params[:weapon])
      session[:my_weapon] = params[:weapon]
      PLAYERS << session[:me]
      WEAPONS << session[:my_weapon]

      # problem I am having.
      # session[:me] is not recognising the specific player
      # always seems to create a new one
      # PLAYERS array stays constant though

      p session[:me]
      p session
      p PLAYERS

      redirect '/waiting'
    end
  end

  get '/waiting' do
    if WEAPONS.count == 2

      p session[:me]

      # problem I am having.
      # session[:me] is not recognising the specific player here
      # seems to create a new one
      # PLAYERS array stays constant though

      p PLAYERS

      find_opponent = PLAYERS.select {|player| player != session[:me] }
      @opponent = find_opponent[0]
      @opponent_weapon = @opponent.weapon

      p @opponent_weapon
      p session[:my_weapon]
      # game = Winner.new(session[:my_weapon], @opponent_weapon)
      # game.the_result_is
      # @result = game.result
    else
    end      
    erb :result_human
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end