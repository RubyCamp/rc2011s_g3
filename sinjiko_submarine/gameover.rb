#require_relative "life"

class Gameover
	def initialize
		@gameover_image = Image.load("images/gameover.png")
	end

	def draw
		Window.draw(120, 0, @gameover_image)
	end

	def play
		draw
	        if (Input.keyPush?(K_SPACE))
			Scene.set_current_scene(:title)
		end
	end
end