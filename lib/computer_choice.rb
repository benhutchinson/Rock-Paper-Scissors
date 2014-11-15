class ComputerPlayer

attr_reader :choice

def initialize
  @weapon_array = ["Rock", "Paper", "Scissors"]
  @random_value_generator = rand(3)
  @choice = @weapon_array[@random_value_generator]
end

end