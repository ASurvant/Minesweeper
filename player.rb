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
    until @board.won?
      turn = choose_tile
      pos = [turn[0][0], turn[0][1]]

      if @board[pos].is_bomb && turn[1].downcase == 'r'
        @board.render_loss
        #puts "You lose."
        raise "You lose"
      end

      @board.reveal(pos, turn[1])
      @board.render
    end

    puts "You win!" unless !@board.won?
  end
end

Player.new
