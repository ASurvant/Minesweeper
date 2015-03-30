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

  def render
    @grid.length.times do |i|
      output = ""
      @grid.first.length.times do |j|
        output << " " + grid[i][j].display
      end
      puts output
    end
  end

  def reveal(pos, command)
    if command.downcase == 'r'
      self[pos].revealed = true
    elsif command.downcase == 'f'
      self[pos].flag!
    end
  end

  def won?
    false
  end
  def lose?
    false
  end
  def []=(pos, state)
    row, col = pos
    @grid[row][col] = state
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def on_board?(pos)
    row, col = pos
    if row < 0 || col < 0
      return false
    elsif row >= @grid.size || col >= @grid.first.size
      return false
    end
    true
  end

  def generate_bombs
    Array.new(10)
      .map { [rand(9), rand(9)] }
      .each { |pos| self[pos].bomb! }
  end
end
