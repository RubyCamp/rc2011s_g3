require 'dxruby'

#効果音を表すクラス
class Kouka
#ファイルを読み込み、Soundオブジェクトを生成して返します。
	def initialize
		@sound={}
		@sound[:emergence]=Sound.new("sounds/drop1.wav")
		@sound[:bgm]= Sound.new("sounds/bgm1.mid")
		@sound[:damage]= Sound.new("sounds/damage.wav")
		@sound[:kaisyuu]= Sound.new("sounds/kaihuku.wav")
	end

	def volume(keyword,vol)
		@sound[keyword].setVolume( vol )
	end

	def pop(keyword)
		@sound[keyword].play
	end
end
