class GameBoard
  @@board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ]
  @@turn = 0

  def self.turn
    @@turn
  end

  def self.print_board
    #   implement the method
    puts 'game board here'
    @@board.each do |row|
      row.each do |cell|
        print "| #{cell} |"
      end
      puts
    end
  end

  def self.add_mark(position)
    puts position[0].to_i - 1, position[2].to_i - 1
    @@board[position[0].to_i - 1][position[2].to_i - 1] = if @@turn.even?
                                                            'X'
                                                          else
                                                            'O'
                                                          end
    @@turn += 1
  end

  def self.outcome
    #   outcome after each move
    if @@turn < 5
      return false
    elsif @@turn == 9
      return 'DRAW!'
    end

    # horizontal check
    @@board.each do |row|
      if (row.count('X') == 3) || (row.count('O') == 3)
        return true
      end
    end

    if (@@board[0][0] == @@board[1][1] && @@board[1][1] == @@board[2][2] && @@board[2][2] == 'X') || (@@board[0][0] == @@board[1][1] && @@board[1][1] == @@board[2][2] && @@board[2][2] == 'O')
      return true
    end
    if (@@board[0][2] == @@board[1][1] && @@board[1][1] == @@board[2][0] && @@board[2][0] == 'X') || (@@board[0][2] == @@board[1][1] && @@board[1][1] == @@board[2][0] && @@board[2][0] == 'O')
      return true
    end

    #   check vertically
    count_x = 0
    count_o = 0
    3.times do |i|
      3.times do |j|
        if @@board[j][i] == 'X'
          count_x += 1
        elsif @@board[j][i] == 'O'
          count_o += 1
        end
      end
      if (count_x == 3) || (count_o == 3)
        return true
      else
        count_o = 0
        count_x = 0
      end
    end

    false
  end
end
