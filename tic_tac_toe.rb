class Game
  @@board = [1,2,3,4,5,6,7,8,9]
  @@WIN_COMBINATION = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  @@first_player = "X"
  @@last_player = "O"
  @@winner

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
    # @@board[index].is_a? String
    @@board[index].class == String
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

  def is_won
    @@WIN_COMBINATION.each do |item|
      value_1 = @@board[item[0]]
      value_2 = @@board[item[1]]
      value_3 = @@board[item[2]]
      @@winner = value_1
      return value_1 == value_2 && value_2 == value_3 
    end
  end

end

game = Game.new
game.add_to_display(0, "X")
game.add_to_display(1, "X")
game.add_to_display(2, "X")
game.display

p game.is_won