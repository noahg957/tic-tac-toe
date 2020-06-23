# ruby board.rb

class Board
  def initialize
    @pure_board = Array[1,2,3,4,5,6,7,8,9]
    @game_board = Array[[1,2,3],[4,5,6],[7,8,9]]
    @occupied_spaces = []
    @win = false
  end
  attr_reader :win
  def display_board
    puts @game_board.map { |x| x.join(' ')}
  end
  def place_token(number, token)
    if @pure_board.include?(number.to_i)
      number = number.to_i
      if @occupied_spaces.include?(number)
        error_message(token, "that space is already occupied")
      else
        @occupied_spaces.push(number)
        if number <= 3
          @game_board[0][number-1] = token
        elsif number <= 6
          @game_board[1][number-4] = token
        else 
          @game_board[2][number-7] = token
        end
      end
    else
      error_message(token, "you did not enter a number 1-9")
    end
  end
  def error_message(token, error)
    puts "Sorry, that is not a valid entry, because #{error}.\nPlease enter a valid number:"
    number = gets.chomp
    place_token(number, token)
  end
  def check_board(token, name)
    if @game_board.include?([token,token,token]) == true
      puts "Congratulations #{name}! You win!"
      @win = true
    elsif  @game_board[0][0] == token && @game_board[1][0] == token && @game_board[2][0] == token
      puts "Congratulations #{name}! You win!"
      @win = true
    elsif @game_board[0][1] == token && @game_board[1][1] == token && @game_board[2][1] == token
      puts "Congratulations #{name}! You win!"
      @win = true
    elsif @game_board[0][2] == token && @game_board[1][2] == token && @game_board[2][2] == token
      puts "Congratulations #{name}! You win!"
      @win = true
    elsif @game_board[0][0] == token && @game_board[1][1] == token && @game_board[2][2] == token
      puts "Congratulations #{name}! You win!"
      @win = true
    elsif @game_board[0][2] == token && @game_board[1][1] == token && @game_board[2][0] == token
      puts "Congratulations #{name}! You win!"
      @win = true
    elsif @occupied_spaces.sort == [1,2,3,4,5,6,7,8,9]
      puts "Cat's game!"
      @win = true
    else 
      @win = false
    end
  end

end

