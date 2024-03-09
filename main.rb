require './player'
require './game_board'
puts 'Enter player-1 and player-2 names each on a separate line'
player1_name = gets
player2_name = gets
separator = '-----------------------------------------------------------------'
player1 = Player.new(player1_name)
player2 = Player.new(player2_name)
puts separator
print("Player-X: #{player1.name}\nPlayer-O: #{player2.name}\n")

while true
  GameBoard.print_board
  puts 'Enter the cell coordinate to play'
  puts 'For example, if you want to place your mark on 5th cell then type: 2,2 with no spaces'
  if GameBoard.turn.even?
    puts "#{player1.name.chomp} turn"
  else
    puts "#{player2.name.chomp} turn"
  end
  position = gets

  GameBoard.add_mark(position)
  GameBoard.print_board
  puts separator
  outcome = GameBoard.outcome
  if ['DRAW!', true].include?(outcome)
    if outcome == 'DRAW!'
      puts outcome
      break
    end
    if GameBoard.turn.even?
      puts "#{player1.name.chomp} WON!"
    else
      puts "#{player2.name.chomp} WON!"
    end
    break
  end
end

