class Board
  attr_accessor :s1, :s2, :s3, :s4, :s5, :s6, :s7, :s8, :s9

  def initialize(s1=" ",s2=" ",s3=" ",s4=" ",s5=" ",s6=" ",s7=" ",s8=" ",s9=" ")
    @s1, @s2, @s3, @s4, @s5, @s6, @s7, @s8, @s9 = s1, s2, s3, s4, s5, s6, s7, s8, s9
  end

  def generate
    puts "      #{@s1} | #{@s2} | #{@s3} "
    puts "     -----------"
    puts "      #{@s4} | #{@s5} | #{@s6} "
    puts "     -----------"
    puts "      #{@s7} | #{@s8} | #{@s9} "
  end

end

class Player
  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end

  def takes_turn(board)
    puts "   \n   Enter position number for #{@letter.to_s}:"
    position = gets.chomp
    case position
    when "1"
      board.s1 = @letter.to_s
    when "2"
      board.s2 = @letter.to_s
    when "3"
      board.s3 = @letter.to_s
    when "4"
      board.s4 = @letter.to_s
    when "5"
      board.s5 = @letter.to_s
    when "6"
      board.s6 = @letter.to_s
    when "7"
      board.s7 = @letter.to_s
    when "8"
      board.s8 = @letter.to_s
    when "9"
      board.s9 = @letter.to_s
    else
      puts "\n   Not a valid number."
      takes_turn(board)
    end
  end

end

class Game

  def initialize
    @player1 = Player.new("X")
    @player2 = Player.new("0")
    @active_player = @player1
    @winner = false
  end


  def switch_player
    @active_player == @player1 ? @active_player = @player2 : @active_player = @player1
  end

  def straight_line?(arr)
      if arr.all? { |piece| piece == "X"} then @winner = @player1 end
      if arr.all? { |piece| piece == "0"} then @winner = @player2 end
  end

  def check_rows(board)
       straight_line?([board.s1, board.s2, board.s3])
       straight_line?([board.s4, board.s5, board.s6])
       straight_line?([board.s7, board.s8, board.s9])
       straight_line?([board.s1, board.s4, board.s7])
       straight_line?([board.s2, board.s5, board.s8])
       straight_line?([board.s3, board.s6, board.s9])
       straight_line?([board.s1, board.s5, board.s9])
       straight_line?([board.s7, board.s5, board.s3])
  end

  def start
    puts "\n     Welcome to Tic-Tac-Toe.\n "
    puts "     In order to place a piece, enter the number that corresponds\n     with the position on the board:\n "

    sample_board = Board.new(1,2,3,4,5,6,7,8,9)
    sample_board.generate

    puts "\n   X starts first.\n "

    gameboard = Board.new

    until @winner
      gameboard.generate
      switch_player
      @active_player.takes_turn(gameboard)
      check_rows(gameboard)

    end

    gameboard.generate
    puts "\n   #{@active_player.letter} wins!\n"
  end

end

game = Game.new
game.start
