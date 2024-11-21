class BoardDataFormatter
  def initialize(data)
    @data = data
  end

  def format
    @data.map do |row|
      row.map do |cell|
        "<span class=\"board-cell\" data-number=\"#{cell}\">#{cell != 9 ? "⬜️" : "💣"}</span> "
      end << "<br>"
    end.join.html_safe
  end
end
