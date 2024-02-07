class Game
  @@board = [1,2,3,4,5,6,7,8,9]
  # @@board = ["X","O","X","O","O","X", "X", "X", "O"]
  @@win_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [3, 5, 8], [0, 4, 8], [2, 4, 6]]
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
  puts "Please enter number between 1 - 9"
  index = gets.chomp.to_i - 1
  until valid_input(index) && !is_taken(index)
    puts "You Input wrong value. You have to input between 1 - 9."
    index = gets.chomp.to_i - 1
  end
  index
  end

  def is_won
    # @@win_combinations.any? do |item|
    #   item.all? do |i| 
    #   @@winner = @@board[i]
    #   @@board[i] == @@first_player || @@board[i] == @@last_player
    #   end
    # end

    @@win_combinations.any? do |item|
      value_1 = @@board[item[0]]
      value_2 = @@board[item[1]]
      value_3 = @@board[item[2]]
      @@winner = @@board[item[0]]
      value_1 == value_2 and value_2 == value_3
    end
  end

  def is_full
    @@board.all? { |item| item.class != Integer }
  end

  def is_draw
    !is_won && is_full
  end

  def is_over
    is_won || is_full
  end

  def message
    is_won ? "The winner is #{@@winner}! Congratulations!!!" : "Game over!!!"
  end

  def play
    count = 1
    until is_over
      index = get_input
      add_to_display(index, current_player(count))
      display
      count += 1
    end
     puts message
  end
end

puts "Tic Tac Toe Game"
puts "1 | 2 | 3"
puts "---------"
puts "4 | 5 | 6"
puts "---------"
puts "7 | 8 | 9"
game = Game.new
puts game.play

