class Winner2Player

  attr_reader :result

  def initialize(player_choice, opponent_choice)
    @player_choice = player_choice
    @opponent_choice = opponent_choice
    @result
  end

  def the_result_is
    if @opponent_choice == @player_choice
      @result = "It's A Draw"
    elsif @opponent_choice == "Rock" && @player_choice == "Scissors"
      @result = "The opponent won"
    elsif @opponent_choice == "Scissors" && @player_choice == "Paper"
      @result = "The opponent won"
    elsif @opponent_choice == "Paper" && @player_choice == "Rock"
      @result = "The opponent won"
    else
      @result = "You win"
    end
  end

end