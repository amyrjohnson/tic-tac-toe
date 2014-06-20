# require 'Matrix'
# require './board.rb'
# require './tic_tac_toe.rb'
class Player
    #player has marker and order (first or second)
    attr_accessor :marker, :order, :name, :number
    def initialize(name)
        puts "Making a new player"
        @name = name
    end

    def first?
        self.order == 1
    end

    def move(gameboard)
        #choose move from set of available moves 
        #random for now
        puts "possible moves #{gameboard.moves}"
        puts "player is choosing a move"
        gameboard.moves.sample

    end

end
