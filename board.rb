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
        @turns = 0
    end

    def move(player, position)
        #check if postion is empty
        puts "board is updating"
        @board[position[0],position[1]] = player.number if @board[position[0], position[1]] == 0
        puts "current board:"
        puts @board
        puts "end of turn #{@turns}"
        @turns += 1
        @player = player
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
        row_col_win? || diagonals_win?
    end

    def row_col_win?
        row_col_win = false
        i = 0
        3.times do 
            puts "checking row/col #{i}"
            if @board.row(i).to_a.inject {|sum, n| sum + n} == 3 * @player.number
                puts "There's a row TTT"
                row_col_win = true
            elsif @board.column(i).to_a.inject {|sum, n| sum + n} == 3 * @player.number
                puts "There's a column TTT"
                row_col_win = true
            end
            i += 1
        end
        row_col_win
    end


    def diagonals_win?
        diagonals_win = false
        diag_sum = 0
        rev_diag_sum = 0
        @board.each(:diagonal){|elem| diag_sum += elem}
        self.swap_cols.each(:diagonal){|elem| rev_diag_sum += elem}

        if diag_sum == 3 * @player.number
            puts "Theres a diagonal TTT"
            diagonals_win = true
        elsif rev_diag_sum == 3 * @player.number
            puts "Theres a reverse diagonal TTT"
            diagonals_win = true
        end
        diagonals_win
    end


    def tie?
        #checks if tie
        if @turns == 8
            true
        else
            false
        end
    end

    def swap_cols
        cols = @board.column_vectors
        puts cols.inspect
        Matrix.columns([cols[2], cols[1], cols[0]])
    end

end