# encoding: Shift_JIS
require_relative 'player'
require_relative 'garbage'
require_relative 'life'

class Game
	attr_reader :player1
	attr_reader :player2
	def initialize
		@player1 = Player.new(180, 400, 5, "images/submarine1P.png", 1)
		@player2 = Player.new(580, 400, 5, "images/submarine2P.png", 2)
		@garbages = []
		@lake5 = Image.load("images/lake5.png")
		@lake4 = Image.load("images/lake4.png")
		@lake3 = Image.load("images/lake3.png")
		@lake2 = Image.load("images/lake2.png")
		@lake1 = Image.load("images/lake1.png")
		@under = Image.load("images/under.png")
                @font = Font.new(46)
		18.times do |i|
		@garbages[i] = Garbage.new
		end
		@life = Life.new
		@score = Score.new(0)
	end

	def play
		case @garbages[0].check_clear
			when 0, 1, 2, 3
				Window.draw(0, 0, @lake5 )
			when 4, 5, 6, 7
				Window.draw(0, 0, @lake4 )
			when 8, 9, 10, 11
				Window.draw(0, 0, @lake3 )
			when 12, 13, 14, 15
				Window.draw(0, 0, @lake2 )
			when 16, 17, 18, 19
				Window.draw(0, 0, @lake1 )
		end
		Window.draw(0, 0, @under )
                Window.drawFont(20, 540, "宍道湖くん", @font)
		@player1.move
		@player2.move
		@player1.draw
		@player2.draw
		@garbages.each do |char|
			char.move
			char.draw
		end
		check_collision
		@player1.score_draw
		@player2.score_draw
		@life.draw
		@life.check_die
	end

	def check_collision
		Collision.check(@player1.collision, @garbages.collect{|garbage| garbage.collision})
		Collision.check(@player2.collision, @garbages.collect{|garbage| garbage.collision})
	end
end
