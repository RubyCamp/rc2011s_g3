# encoding: Shift_JIS

class Score
	attr_reader :score
	def initialize(player_num)
		@score = 0
		@size = 40
		@type1 = "HGP教科書体"
		@type2 = "HGS創英角ポップ体"
		@type = @type1
		@font = Font.new(@size, @type)
		@player = player_num
	end

	def point
		@score += 1
		#@size += 1 if( @score <= 10 )
		case @score
			when 2
				@size += 10
			when 4
				@size += 10
			when 6
				@size += 10
			when 8
				@size += 10
			when 10
				@size += 10
				@type = @type2
		end
		@font = Font.new(@size, @type)
	end

	def draw
		case @player
			when 1
				
				Window.drawFont(600, 450, @score.to_s, @font)
			when 2
				Window.drawFont(600, 520, @score.to_s, @font)
		end
	end
end
