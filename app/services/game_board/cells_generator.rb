module GameBoard
  class CellsGenerator
    def initialize(height, width, number_of_mines)
      @height = height
      @width = width
      @number_of_mines = number_of_mines
    end

    def generate
      initialize_board
      placing_mines
      placing_numbers

      board
    end

    private
      attr_reader :board, :height, :width, :number_of_mines

      def initialize_board
        @board = Array.new(height) { Array.new(width) }
      end

      # generate all possible cell coordinates
      def cell_coordinates
        @cell_coordinates ||= height.times.to_a.product(width.times.to_a)
      end

      # and pick mine coordinates randomly without duplicates
      def mine_coordinates
        @mine_coordinates ||= cell_coordinates.sample(number_of_mines)
      end

      def placing_mines
        mine_coordinates.each do |row, column|
          board[row][column] = 'M'
        end
      end

      def placing_numbers
        cell_coordinates.each do |row, column|
          next if board[row][column] == 'M'

          board[row][column] = count_mines_around(row, column)
        end
      end

      def count_mines_around(row, column)
        mine_count = 0

        ([-1, 0, 1].repeated_permutation(2).to_a - [[0, 0]]).each do |dx, dy|
          r = row + dx
          c = column + dy
          next if r < 0 || c < 0 || r >= height || c >= width

          mine_count += 1 if board[r][c] == 'M'
        end

        mine_count
      end
  end
end
