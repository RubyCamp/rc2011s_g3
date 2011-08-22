require 'dxruby'
require 'dxrubyex'
require_relative "game"
require_relative "garbage"
require_relative "life"
require_relative "sounds"
require_relative "scene"
require_relative "title"
require_relative "ending"
require_relative "gameover"

SCREEN_WIDTH  = 800
SCREEN_HEIGHT = 600
WINDOW_TITLE  = "Sinjiko_Submarine"

Window.caption = WINDOW_TITLE
Window.width   = SCREEN_WIDTH
Window.height  = SCREEN_HEIGHT

title = Title.new
game = Game.new
garbage = Garbage.new
life = Life.new
gameover = Gameover.new
ending = Ending.new( game.player1.score, game.player2.score,)

Scene.add_scene(title,  :title)
Scene.add_scene(game,   :game)
Scene.add_scene(gameover,   :gameover)
Scene.add_scene(ending,   :ending)

Scene.set_current_scene(:title)

kouka = Kouka.new()
kouka.pop(:bgm)
kouka.volume(:bgm,230)

Window.loop do
	break if Input.keyPush?(K_ESCAPE)  
	if(life.check_die == 0)
		Scene.set_current_scene(:gameover)
	end
	if(garbage.check_clear >= 20)
		Scene.set_current_scene(:ending)
	end
	Scene.play_scene
end