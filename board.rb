
class Board

  def initialize
    @grid = Array.new(9) { Array.new(9) }
    populate
    generate_bombs
  end

  def populate
    @grid.length.times do |i|
      @grid.first.length do |j|
        @grid[i][j] = Tile.new(false, [i, j], self)
      end
    end
  end

  def reveal(pos)

  end

  def win?

  end

  def []=(pos, state)
    row, col = pos[0], pos[1]
    @grid[row][col] = state
  end

  def [](pos)
    row, col = pos[0], pos[1]
    @grid[row][col]
  end

  def generate_bombs
    Array.new(10)
      .map { [rand(9), rand(9)] }
      .each { |pos| self[pos].bomb! }
  end
end

class Tile
  NEIGHBOR = [
    [ 1,  0],
    [ 1,  1],
    [ 0,  1],
    [-1,  1],
    [-1,  0],
    [-1, -1],
    [ 0, -1],
    [ 1, -1]
  ]



  def initialize(is_bomb, pos, board)
    @is_bomb = is_bomb
    @revealed = false # false default
    @pos = pos
    @board = board
  end

  def generate_value

  end

  def bomb!
    @is_bomb = true
  end

  def reveal

  end

  def state
    if @revealed
      return @contents
    end
  end
end

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
