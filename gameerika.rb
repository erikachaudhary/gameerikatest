class TicTacToe
    WINNING_COMBINATION = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
    ]

    def initialize
        @participants = Participants.new
    end
    
    def move
        @end = false
        @gameboard = Board.new
        @turn = 1
        while @turn<8
          if @turn % 2 != 0
              turn_sequence(@participants.participant1, "X")
          elsif @turn % 2 == 0
              turn_sequence(@participants.participant2, "O")
          end
        end
    end

    def turn_sequence (participant, symbol)
        puts "#{participant}(#{symbol}) you may choose your position now"
        @participant_move = gets.chomp.to_i
        if (0..8).include?(@participant_move) && @gameboard.board[@participant_move] == " " && @end == false
          @turn += 1
          @gameboard.board_update(@participant_move, symbol)
          win_check
          draw_check
        else
          puts "You need to enter a number between 0 to 8 in location\n"
        end
    end
    
    def win_check
        WINNING_COMBINATION.each do |win_check|
          if (@gameboard.board[win_check[0]] == @gameboard.board[win_check[1]] && 
            @gameboard.board[win_check[1]] == @gameboard.board[win_check[2]]) &&
            @gameboard.board[win_check[0]] != " "
            if @gameboard.board[win_check[0]] == "X"
              puts "#{@participants.participant1} WINS"
              @turn = 8
              @end = true
              play_again?
            elsif @gameboard.board[win_check[0]] == "O"
              puts "#{@participants.participant2} WINS"
              @turn = 8
              @end = true
              play_again?
            end
          end
        end
    end