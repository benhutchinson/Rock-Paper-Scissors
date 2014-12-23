class Winner

  attr_reader :result

  def initialize(player_choice, opponent_choice, opponent_name)
    @player_choice = player_choice
    @opponent_choice = opponent_choice
    @opponent_name = opponent_name
    @result
  end

  def the_result_is
    if @opponent_choice == @player_choice
      @result = "It's A Draw"
    elsif opponent_wins?
      @result = @opponent_name + " wins"
    else
      @result = "You win"
    end
  end

  def opponent_wins?
    if @opponent_choice == "Rock" && @player_choice == "Scissors"
      true
    elsif @opponent_choice == "Scissors" && @player_choice == "Paper"
      true
    elsif @opponent_choice == "Paper" && @player_choice == "Rock"
      true
    else 
      false
    end
  end
  
end