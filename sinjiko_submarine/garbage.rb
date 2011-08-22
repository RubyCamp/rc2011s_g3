# encoding: Shift_JIS
require_relative "life"
require_relative "shinji"
require_relative "sounds"

class Garbage
	attr_accessor :collision
	@@garbage_kinds = [
				["can1", "can2", "fridge", "apple", "fish", "shijimi"],#ゴミの見た目
				[     2,      4,        3,      1 ,      7,         5]# ゴミの落ちる速度
			]
	@@font = Font.new(32)
	@@life = Life.new
	@@score_sum = 0
	def initialize
		@wave = 0
		reborn
		@isExit = FALSE
		@collision = CollisionBox.new(self, 0, 0, @image.width-1, @image.height-1)
                @shinji = Shinji.instance
                @kouka = Kouka.new()
	end

	def reborn
		@x = rand(750)
		@y = -300
		@kind = rand(6)
		@v = @@garbage_kinds[1][@kind]
		case rand(2)
			when 0
				@rl = 1
			when 1
				@rl = -1
		end
		case rand(2)
			when 0
				@ud = 1
			when 1
				@ud = -1
		end
		image_file = "images/#{@@garbage_kinds[0][@kind]}.png"
		@image = Image.load(image_file)
		@collision.set(@x, @y) if( @wave > 0 )
	end

	def move
		@wave += 1
		if(@isExit == TRUE)
			@y += @v
			wave_x = @wave % 80
			case @kind
				when 0#can1
					case wave_x
						when 0, 10, 60, 70
							@x += 3
						when 20, 30 ,40 ,50
							@x -= 3
					end
				when 1#can2
					case wave_x
						when 15, 25, 75, 5
							@x += 3
						when 35, 45 ,55 ,65
							@x -= 3
					end
				#fridgeは揺れない
				when 3#apple
					case wave_x
						when 0, 5, 15, 25, 50, 75
							@x += 3
						when 35, 36, 38, 39, 40, 45, 55, 65, 70
							@x -= 2
					end
				when 4#fish
					if( wave_x < 20 || wave_x >60 )
						@x += 2
					else
						@x -= 2
					end
			end
			@collision.set(@x, @y)
		elsif( @isExit == FALSE )
			if(rand(1800) == 0)
				@isExit = TRUE
			        @kouka.pop(:emergence)
                                @kouka.volume(:bgm,200)
			end
		end
		if( @x > 800-@image.width )
			@x = 800-@image.width
		elsif( @x < 0 )
			@x = 0
		end
                if( @y > 370-@image.height )
                        @shinji.talk(:rule)
                end
		if( @y > 540-@image.height )
			@@life.damage
			@isExit = FALSE
			reborn
                        @shinji.talk(:damage)
                        @kouka.pop(:damage)
		end
	end

	def draw
		if( @isExit )
			@shinji.update
			Window.drawScale(@x, @y, @image, @rl,@ud)
		end
	end

	def check_clear
		return @@score_sum
	end

	def shot(obj)
	end

	def hit(obj)
		@isExit = FALSE
                @@score_sum += 1
		reborn
                @shinji.talk(:doya)
	end

end
