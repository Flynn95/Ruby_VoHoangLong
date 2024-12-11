class BoardsController < ApplicationController
  before_action :set_board, only: %i[show destroy]

  def index
    @boards = Board.all.order(created_at: :desc)
  end

  def show
    @preformatted_data = GameBoard::DataFormatter.new(@board.data).format
  end

  def create
    @board = Board.new(board_params)
    @board.data = GameBoard::CellsGenerator.new(@board.height, @board.width, @board.number_of_mines).generate if @board.valid?

    if @board.save
      redirect_to root_path, notice: "Minesweeper board was successfully created. Click #{view_context.link_to 'here', board_path(@board), class: "alert-link"} to view it."
    else
      flash[:alert] = @board.errors.full_messages
      redirect_to root_path(board_params)
    end
  end

  def destroy
    @board.destroy

    if params[:redirect_location].present?
      redirect_to params[:redirect_location], notice: "Minesweeper board was successfully destroyed."
    else
      redirect_back fallback_location: boards_url, notice: "Minesweeper board was successfully destroyed."
    end
  end

  private
    def board_params
      params.require(:board).permit(:name, :creator_email, :height, :width, :number_of_mines)
    end

    def set_board
      @board = Board.find_by(id: params[:id])
      redirect_back fallback_location: boards_url, alert: "Minesweeper board not found." if @board.blank?
    end
end
