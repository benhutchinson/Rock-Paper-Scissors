
class Test

  attr_reader :result

  def initialize(player_choice, computer_choice)
    @player_choice = player_choice
    @computer_choice = computer_choice
    @result
  end

  def the_result_is
    if @computer_choice == @player_choice
      @result = "It's A Draw"
    elsif @computer_choice == "Rock" && @player_choice == "Scissors"
      @result = "Computer wins"
    elsif @computer_choice == "Scissors" && @player_choice == "Paper"
      @result = "Computer wins"
    elsif @computer_choice == "Paper" && @player_choice == "Rock"
      @result = "Computer wins"
    else
      @result = "You win"
    end
  end

end

test = Test.new("Rock", "Paper")

test.the_result_is

puts test.result