class Game

  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
  # @@board = ["X","O","X","O","O","X", "X", "X", "O"]
    @win_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [3, 5, 8], [0, 4, 8], [2, 4, 6]]
    @first_player = "X"
    @last_player = "O"
  end

    def play
    count = 1
    puts "Tic Tac Toe Game"
    display
    loop do
      index = get_input
      add_to_display(index, current_player(count))
      display
      return message if over?
      count += 1
    end
  end

  def display
    display = ""
    @board.each_with_index do |item, index|
      index%3 == 0 ? display +=  "\n---------\n" + "#{item}" : display += " | #{item}"
    end
    display += "\n---------\n"
    puts display
  end

  def add_to_display(index, player)
    @board[index] = player
  end

  def current_player(count)
    count.odd? ? @first_player : @last_player
  end

  def is_taken(index)
    # ask type of date in @@board[index]
    # @@board[index].is_a? String
    @board[index].class == String
  end

  def valid_input(input)
    (0..8).include?(input)
  end

  def get_input
    puts "Please enter number between 1 - 9"
    loop do
      index = gets.chomp.to_i - 1
      return index if valid_input(index) && !is_taken(index)
      puts "You Input wrong value. You have to input between 1 - 9."
    end
  end

  def won?
    # @@win_combinations.any? do |item|
    #   item.all? do |i|
    #   @@winner = @@board[i]
    #   @@board[i] == @@first_player || @@board[i] == @@last_player
    #   end
    # end

    @win_combinations.any? do |item|
      value_1, value_2, value_3 = @board[item[0]], @board[item[1]], @board[item[2]]
      @winner = @board[item[0]]
      value_1 == value_2 and value_2 == value_3
    end
  end

  def full?
    @board.all? { |item| item.class != Integer }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def message
    won? ? "The winner is #{@winner}! Congratulations!!!" : "Game over!!!"
  end
end

game = Game.new
puts game.play
