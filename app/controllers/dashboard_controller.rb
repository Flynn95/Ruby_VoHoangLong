class DashboardController < ApplicationController
  def index
    @board = Board.new(board_params)
    @most_recent_boards = Board.order(created_at: :desc).limit(10)
  end

  private
    def board_params
      params.permit(:name, :creator_email, :height, :width, :number_of_mines)
    end
end
