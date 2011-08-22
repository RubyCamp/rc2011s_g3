#require_relative "life"
class Title

	def initialize
		@title_image = Image.load("images/title.png")
	end

	def draw
		Window.draw(120, 0, @title_image)
	end

	def play
		draw
		if (Input.keyPush?(K_SPACE))
			Scene.set_current_scene(:game)
            end
	end
end
