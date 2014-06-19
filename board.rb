require 'Matrix'
# require './player.rb'
# require './tic_tac_toe.rb'

class Matrix
    def []=(i, j, x)
        @rows[i][j] = x
     end
end

class GameBoard
    #board starts empty
    #board updates when players move and keeps track
    #board knows when a player has won

    def initialize
        @board = Matrix.build(3) {0}
        turns = 0
    end

    def move(player, position)
        #check if postion is empty
        puts position.inspect
        puts "board is updating"
        @board[position[0]][position[1]] = player.marker if @board[position[0]][position[1]] == 0
        turns += 1
    end

    def moves
        #list available moves
        moves = []
        @board.each_with_index do |square, row, col|
            moves << [row, col] if square == 0
        end
        moves
    end

    def win?
        #Somehow iterate through potential tic-tac toes?
        # if board.rows.all?{|square| square = player.marker}
        #     true
        # elsif board.rows.all?{|square| square = player.marker}
        #     true
        # elsif board.diagonals.all?{|square| square = player.marker}
        # end
        false
    end

    def tie?
        #checks if tie
        if turns == 9
            true
        else
            false
        end
    end
end