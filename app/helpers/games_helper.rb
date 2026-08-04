module GamesHelper
  def check_winner(board)
    winning_combos = [
      [ 0, 1, 2 ], [ 3, 4, 5 ], [ 6, 7, 8 ], # rows
      [ 0, 3, 6 ], [ 1, 4, 7 ], [ 2, 5, 8 ], # columns
      [ 0, 4, 8 ], [ 2, 4, 6 ]           # diagonals
    ]
    winning_combos.each do |combo|
      values = combo.map { |i| board[i] }
      return values.first if values.uniq.size == 1 && values.first.present?
    end
    nil
  end
end
