module GameBoard
  class DataFormatter
    def initialize(data)
      @data = data
    end

    def format
      # improve ActionView render time
      @data.map do |row|
        row.map do |cell|
          "<span class=\"board-cell\" data-number=\"#{cell}\">#{cell != 'M' ? "⬜️" : "💣"}</span> "
        end << "<br>"
      end.join.html_safe
    end
  end
end
