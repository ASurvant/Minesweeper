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

  attr_reader :neighbors, :is_bomb
  attr_accessor :revealed, :is_flagged

  def initialize(is_bomb, pos, board)
    @is_bomb = is_bomb
    @revealed = false
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

  # return a Fixnum
  def adjacent_bombs
    return @bomb_count if @bomb_count

    @bomb_count = 0
    @neighbors.each do |neighbor|
      @bomb_count += 1 if @board[neighbor].is_bomb
    end

    @bomb_count
  end


  def display
    if @is_flagged
      "F"
    elsif !@revealed
      "*"
    else
      return "_" if adjacent_bombs == 0
      adjacent_bombs.to_s
    end
  end

  def flag!
    @is_flagged = true
  end

  def bomb!
    @is_bomb = true
  end

  def revealy
    @revealed = true
    if self.adjacent_bombs == 0
      n = neighbors
      n.each do |pos|
        @board[pos].revealy if !@board[pos].revealed
      end
    end
    nil
  end
end
