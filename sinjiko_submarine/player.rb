# encoding: Shift_JIS
require_relative 'score'
require_relative "shinji"
require_relative "sounds"

class Player
	attr_accessor :collision
	attr_reader :score
	@@font = Font.new(32)
	def initialize(x, y, v, image_file = "images/submarine.png", player_num)
		@x = x
		@y = y
		@v = v
		@image = Image.load(image_file)
		@rl = 1
		@collision = CollisionBox.new(self, 10, 30, @image.width - 10, @image.height - 10)
		@collision.set(@x, @y)
		@score = Score.new(player_num)
		@shinji = Shinji.instance
		@kouka = Kouka.new()
	end

	def move
		x = Input.x
		if( x == 1 )
			@rl = 1
		elsif( x == -1 )
			@rl = -1
		end
		
		@x += x*@v
		@y += Input.y*@v
		
		if( @x > 800-@image.width )
			@x = 800-@image.width
		elsif( @x < 0 )
			@x = 0
		end
		if( @y > 420 )
			@y = 420
		elsif( @y < 0 )
			@y = 0
		end
		
		@collision.set(@x, @y)
	end

	def draw
		if( @rl == 1 )
			Window.drawScale(@x, @y, @image, -1, 1)
		elsif( @rl == -1 )
			Window.drawScale(@x, @y, @image, 1, 1)
		end
		@shinji.update
	end

	def score_draw
		@score.draw
	end

	def shot(obj)
		@score.point
		@shinji.talk(:doya)
		@kouka.volume(:kaisyuu, 250)
 		@kouka.pop(:kaisyuu)
	end

	def hit(obj)
	end

end
