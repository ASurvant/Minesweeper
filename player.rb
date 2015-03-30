class Player
  def initialize
    @board = Board.new
  end

  def choose_tile
    input = gets.chomp
    input = input.split(" ")
    position = [input[0].to_i, input[1].to_i]
    command = input.last

    [position, command]
  end
end
