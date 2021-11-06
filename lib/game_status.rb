# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottome row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal starting at top left
  [6,4,2] # Diagonal starting at bottom left
] 

#won?
def won?(board)

  WIN_COMBINATIONS.find {|wincombo| 
    board[wincombo[0]] == board[wincombo[1]] &&
    board[wincombo[1]] == board[wincombo[2]] &&
    position_taken?(board, wincombo[0])
  }

end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end