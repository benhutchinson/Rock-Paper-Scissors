class Winner

  attr_reader :result

  def initialize(player_choice, computer_choice)
    @player_choice = player_choice
    @computer_choice = computer_choice
    @result
  end

  def the_result_is
    if @computer_choice = @player_choice
      @result = "It's A Draw"
    elsif @computer_choice = "rock" && @player_choice = "scissors"
      @result = "Computer wins"
    elsif @computer_choice = "scissors" && @player_choice = "paper"
      @result = "Computer wins"
    elsif @computer_choice = "paper" && @player_choice = "rock"
      @result = "Computer wins"
    else
      @result = "You win"
    end
  end

end