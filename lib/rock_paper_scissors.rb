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

  get '/reset' do
    PLAYERS = []
    WEAPONS = []
    redirect '/'
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
      game = Winner.new(@weapon, @computer_choice, "Computer")
      game.the_result_is
      @result = game.result
      erb :result
    else 
      my_player = Player.new(session[:my_name], params[:weapon])
      session[:my_weapon] = params[:weapon]
      session[:my_id] = my_player.object_id
      PLAYERS << my_player
      WEAPONS << session[:my_weapon]
      redirect '/waiting'

      # Problem I Was Having Initially
      # before I created session[:my_id]
      # i would assign session[:me] to the new player
      # session[:me] in './waiting', session[:me] did not appear to reference the specific one
      # i.e. always seems to create a new one
      # PLAYERS array stays constant though
      # object_id was best way around this

      # Lesson '1'
      # You should not attach objects to sessions given file size requirements too
      # using their IDs is a better solution
      # alas, databases in future study may also provide better solutions

      # Lesson '2'
      # A Game class could be defined at the outset and designed
      # GAME = Game.new
      # player = Player.new(params[:player_name])
      # GAME.add(player)
      # GAME.winner could also be deployed in the /waiting section

    end
  end

  get '/waiting' do
    if WEAPONS.count == 2
      find_opponent = PLAYERS.select {|player| player.object_id != session[:my_id] }
      @opponent_weapon = find_opponent[0].weapon
      game = Winner.new(session[:my_weapon], @opponent_weapon, "The other player")
      game.the_result_is
      @result = game.result
    else
    end      
    erb :result_human
  end

  post '/reset' do 
    PLAYERS = []
    WEAPONS = []
    redirect '/'

    # this allows a "reset" to occur after two players have played
    # hence no formal Heroku refresh required

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end