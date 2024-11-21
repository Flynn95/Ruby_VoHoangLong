class BoardCellsGenerator
  def initialize(rows_count, columns_count, mines_count)
    @rows_count = rows_count
    @columns_count = columns_count
    @mines_count = mines_count
  end

  def generate
    initialize_board
    placing_mines
    placing_numbers

    @board
  end

  private
    def initialize_board
      @board = Array.new(@rows_count) { Array.new(@columns_count) }
    end

    def cell_coordinates
      @cell_coordinates ||= @rows_count.times.to_a.product(@columns_count.times.to_a)
    end

    def mines_coordinates
      @mines_coordinates ||= cell_coordinates.sample(@mines_count)
    end

    def placing_mines
      mines_coordinates.each do |row, column|
        @board[row][column] = 9
      end
    end

    def placing_numbers
      cell_coordinates.each do |row, column|
        next if @board[row][column] == 9

        @board[row][column] = mines_count(row, column)
      end
    end

    def mines_count(row, column)
      mines = 0

      (row - 1..row + 1).each do |r|
        (column - 1..column + 1).each do |c|
          next if r < 0 || c < 0 || r >= @rows_count || c >= @columns_count

          mines += 1 if @board[r][c] == 9
        end
      end

      mines
    end
end
