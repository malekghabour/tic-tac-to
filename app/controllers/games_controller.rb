class GamesController < ApplicationController
  include GamesHelper

  def index
    session[:board] ||= Array.new(9, "")
    @board = session[:board]
    @winner = check_winner(@board)
  end

  def move
    @board = session[:board]
    index = params[:index].to_i
    if @board[index].blank? && !check_winner(@board)
      @board[index] = current_player
      session[:board] = @board
    end
    redirect_to root_path
  end

  def reset
    session[:board] = Array.new(9, "")
    redirect_to root_path
  end

  private

  def current_player
    x_count = session[:board].count("X")
    o_count = session[:board].count("O")
    x_count <= o_count ? "X" : "O"
  end
end
