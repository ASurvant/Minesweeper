require './tile'

class Board

  attr_reader :grid
  
  def initialize
    @grid = Array.new(9) { Array.new(9) }
    populate
    generate_bombs
  end

  def populate
    @grid.length.times do |i|
      @grid.first.length.times do |j|
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
