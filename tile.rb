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
    @revealed = false # false default
    @pos = pos
    @board = board
    neighbors
  end

  def neighbors
    @neighbors = []
    NEIGHBOR.each do |delta|
      pos_dup = @pos.dup
      x = pos_dup[0] + delta[0]
      y = pos_dup[1] + delta[1]
      @neighbors << [x, y] if @board.grid.include? ([x, y])
    end
    @neighbors
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
