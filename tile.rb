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

  attr_reader :neighbors

  def initialize(is_bomb, pos, board)
    @is_bomb = is_bomb
    @revealed = false #
    @pos = pos
    @board = board
    #@is_flagged = false
    neighbors
  end

  def neighbors
    return @neighbors if @neighbors

    @neighbors = []
    NEIGHBOR.each do |delta|
      x = @pos[0] + delta[0]
      y = @pos[1] + delta[1]
      pos = [x, y]
      @neighbors << pos if @board.on_board?(pos)
    end

    @neighbors
  end

  def generate_value

  end

  def display
    if @is_flagged
    "*"
  end

  def flag!
    @is_flagged = true
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
