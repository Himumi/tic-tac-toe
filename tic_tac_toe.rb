class Game
  @@board = [1,2,3,4,5,6,7,8,9]
  @@first_player = "X"
  @@last_player = "O"

  def display
    puts "#{@@board[0]} | #{@@board[1]} | #{@@board[2]}"
    puts "---------"
    puts "#{@@board[3]} | #{@@board[4]} | #{@@board[5]}"
    puts "---------"
    puts "#{@@board[6]} | #{@@board[7]} | #{@@board[8]}"
  end

  def add_to_display(index, player)
    @@board[index] = player
  end

  def current_player(count)
    count.odd? ? @@first_player : @@last_player
  end

  def is_taken(index)
    # ask type of date in @@board[index]
    @@board[index].is_a? String
    # @@board[index].class == String
  end

  def valid_input(input)
    (0..8).include?(input)
  end

  def get_input
  index = gets.chomp.to_i - 1
  until valid_input(index) && !is_taken(index)
    puts "You Input wrong value. You have to input between 1 - 9."
    index = gets.chomp.to_i - 1
  end
  index
  end
end

game = Game.new
game.display
game.add_to_display(0, "X")
game.display

puts game.current_player(2)
puts game.is_taken(0)
puts game.valid_input(0)
puts game.get_input