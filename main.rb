# ruby main.rb
require 'pry'
require_relative 'lib/board'
require_relative 'lib/player'


puts "Let's play Tic-Tac-Toe"
puts "Player 1, what's your name?"
player_1 = Player.new(name = gets.chomp)
puts "Player 2, what's your name?"
player_2 = Player.new(name = gets.chomp)
continue = 'yes'
while continue == 'yes' do
  puts "Alright, who wants to be X?"
  first_player = gets.chomp
  if player_1.name == first_player
    player_1.token = 'x'
    player_2.token = 'o'
    first_player = player_1
    second_player = player_2
  else 
    player_2.token = 'x'
    player_1.token = 'o'
    first_player = player_2
    second_player = player_1
  end
  puts "Let's play!"
  board = Board.new
  board.display_board
  i = 0
  while i < 9 do
    puts "#{first_player.name}, where would you like to place your token?"
    board.place_token(number = gets.chomp, first_player.token)
    puts ""
    board.display_board
    puts ""
    board.check_board('x', first_player.name)
    if board.win == true
      break
    end
    i += 1
    puts "#{second_player.name}, where would you like to place your token?"
    board.place_token(number = gets.chomp, second_player.token)
    puts ""
    board.display_board
    puts ""
    board.check_board('o', second_player.name)
    if board.win == true
      break
    end
    i += 1
  end
  puts "Do you want to play again?"
  continue = gets.chomp
end
    


