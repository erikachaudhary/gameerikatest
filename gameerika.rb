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