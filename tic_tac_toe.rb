require 'Matrix'
require './board.rb'
require './player.rb'
require 'pry'
#TIC TAC TOE IMPLEMENTATION

#allow player to choose empty square

#keep track of which squares are taken

#alternate players

#know when player has won

#know when tie/game over

class TicTacToe
    attr_accessor :next_player, :first_turn
    def initialize(name1, name2)
        puts "Welcome to tic tac toe!"
        #decides if players are human or computer?
        @gameboard = GameBoard.new #initialize empty board
        @player_a = Player.new(name1)
        @player_b = Player.new(name2)
        @next_player = ""
        @first_turn = true

        self.coinflip
        self.play
    end

    def coinflip
        #decide who goes first and assign markers
        first_player = [@player_a, @player_b].sample
        if first_player == @player_a
            second_player = @player_b
        else
            second_player = @player_a
        end

        first_player.marker = "X"
        first_player.order = 1
        second_player.marker = "O"
        second_player.order = 2

        puts "#{first_player.name} goes first and is X"
        puts "#{second_player.name} goes second and is O"
    end

    def play
        win = false
        while win == false
            alternate_players
            puts "#{next_player}'s turn"
            move = self.next_player.move(@gameboard) #tell player object to choose move
            puts "player chose #{move}"
            @gameboard.move(next_player, move) #then tell board to update itself
            win = true if @gameboard.win? || @gameboard.tie?  #alternate moves until win == true 
        end
        game_over
    end

    def alternate_players
        players = [@player_a, @player_b]
        if self.first_turn
            self.next_player = players.find{|player| player.order = 1}
            self.first_turn = false
        elsif self.next_player == player_a 
            self.next_player = player_b
        elsif self.next_player == player_b
            self.next_player = player_a
        end
    end

    def game_over
        puts "Game over!"
        #end game, state who won or if tie
    end
end

TicTacToe.new("Amy", "Augie")

