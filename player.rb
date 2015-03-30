require './board'

class Player
  def initialize
    @board = Board.new
    play
  end

  def choose_tile
    puts "Give us a Row, Col, and F/R"
    input = gets.chomp
    input = input.split(" ")
    position = [input[0].to_i, input[1].to_i]
    command = input.last

    [position, command]
  end

  def play
    until @board.won? || @board.lose?
      turn = choose_tile
      @board.reveal(turn[0], turn[1])
      @board.render
    end
  end
end
