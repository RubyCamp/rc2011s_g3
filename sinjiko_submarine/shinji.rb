# encoding: Shift_JIS
require 'singleton'

class Shinji
	include Singleton

	def initialize
		@@font = Font.new(46)
		@@kotobas = {:rule => "「ごみが地面に届く前に回収してね」",
			     :damage =>  '「いたいよぉー＞＜」',
			     :doya =>  '「うふふ( ・´ー・｀)」',
			     :cause =>  '「ちゃんと守って」',
			     :pinti =>   '「あと一回でゲームオーバーだよ」'
			}
		@msg = nil
		@talk_count = 0
	end

	def update
		if @talk_count > 0
			Window.drawFont(230, 540, @@kotobas[@msg], @@font) 
			@talk_count -= 1
		end
	end
#ここで指定したカウントフレームだけ宍道湖くんのセリフは表示
	def talk(msg)
		@msg = msg
		@talk_count = 600
	end
end
