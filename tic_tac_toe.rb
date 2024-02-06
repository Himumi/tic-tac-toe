class Game
  def initialize
    @fist_player = "X"
    @last_player = "O"
  end

  def display(board)
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "---------"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "---------"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end
end

game = Game.new
game.display([1,2,3,4,5,6,7,8,9])