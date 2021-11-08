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

    def draw_check
        if @turn == 8 && @end == false
          puts "It's a draw"
          play_again?
        end
    end

    def play_again?
        puts "Would you like to play again? (Y/N)"
          response = ""
          while response != "Y" || response != "N"
            response = gets.chomp.upcase
              if response == "Y"
                newgame = TicTacToe.new
                newgame.move  
              elsif response == "N"
               puts "See you later, aligagor!"
              else 
                puts "Please enter (Y/N)"
              end
          end
      end
    end

    class Participants
        attr_reader :participant1, :participant2
        
        def initialize
          puts "Welcome to Tic Tac Toe game. Participant 1, what's your name?"
          @participant1 = gets.chomp
          puts "#{@participant1} is X"
          puts "Welcome to Tic Tac Toe game. Participant 2, what's your name?"
          @participant2 = gets.chomp
          puts "#{@participant2} is O"
        end

    end 

    class Board
        attr_reader :board
            
        def initialize
          puts "When it's your turn please select one of the following numbers to start the game"
          puts "0 | 1 | 2"
          puts "---------"
          puts "3 | 4 | 5"
          puts "---------"
          puts "6 | 7 | 8"
          @board = [" "," "," "," "," "," "," "," "," "]
        end

        def board_update(position, symbol)
            @board[position] = symbol
            game_board_display(@board)
        end

        def game_board_display (board)
            puts "#{board[0]} | #{board[1]} | #{board[2]}"
            puts "---------"
            puts "#{board[3]} | #{board[4]} | #{board[5]}"
            puts "---------"
            puts "#{board[6]} | #{board[7]} | #{board[8]}"
        end
          
    end
        
        game = TicTacToe.new
        game.move 