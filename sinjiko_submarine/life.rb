#require_relative "shinji"
require_relative "scene"

class Life
	def initialize
		@@life = 3
		@@hp = Image.load("images/hp_fish.png")
	end

	def damage
		@@life -= 1 if(@@life > 0 )
	end

	def check_die
		Scene.set_current_scene(:gameover) if( @@life == 0 )
	end

	def draw
		if( @@life > 2 )
			Window.draw(10, 100+@@hp.height*2+10, @@hp)
		end
		if( @@life > 1 )
			Window.draw(10, 100+@@hp.height+5, @@hp)
		end
		Window.draw(10, 100, @@hp)
	end
end