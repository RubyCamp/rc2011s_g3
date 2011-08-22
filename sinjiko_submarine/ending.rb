class Ending
	def initialize(s1, s2)
		@ending_image = Image.load("images/ending.png")
		@p1_image = Image.load("images/submarine1P.png")
		@p2_image = Image.load("images/submarine2P.png")
		@@score1 = s1
		@@score2 = s2
		@font = Font.new(40)
	end

	def draw
		Window.draw(120, 0, @ending_image)
		Window.drawScale(260, 180, @p1_image, 1, 1)
		Window.drawScale(260, 280, @p2_image, 1, 1)
		Window.drawFont(400, 180, @@score1.to_s, @font)
		Window.drawFont(400, 280, @@score2.to_s, @font)
	end

	def play
		draw
		if (Input.keyPush?(K_SPACE))
			Scene.set_current_scene(:title)
		end
	end
end