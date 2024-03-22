LA = love.audio
LT = love.timer
LK = love.keyboard
LM = love.math
LG = love.graphics
LW = love.window
LF = love.filesystem

require("lib.math_ex")
require("lib.vector")
game = require("mod.game")

require("mod.transform")
require("mod.collider")
require("mod.outils")

game.assets_manager:Add_Object("terrain", require("obj.terrain"))
game.assets_manager:Add_Object("plateforme", require("obj.plateforme"))
game.assets_manager:Add_Object("player", require("obj.player"))

intro = require("scenes.intro")
menu = require("scenes.menu")
play = require("scenes.play")
victoire = require("scenes.victoire")
defaite = require("scenes.defaite")

--[[game.assets_manager:Load_Font("font_24", "font/Inconsolata-Regular.ttf")
game.assets_manager:Load_Font("font_30", "font/Inconsolata-Regular.ttf")
game.assets_manager:Load_Font("font_40", "font/Inconsolata-Regular.ttf")
game.assets_manager:Load_Font("font_70", "font/Inconsolata-Regular.ttf")]]

game.assets_manager:Load_Image("img_ship", "images/ship.png")
game.assets_manager:Load_Image("img_engine", "images/engine.png")

game.assets_manager:Load_Video("video_intro", "videos/vdo_intro.ogv")

--[[game.assets_manager:Load_Sound("snd_explode_large", "sons/bangLarge.wav")
game.assets_manager:Load_Sound("snd_explode_medium", "sons/bangMedium.wav")
game.assets_manager:Load_Sound("snd_explode_small", "sons/bangSmall.wav")
game.assets_manager:Load_Sound("snd_new_live", "sons/newlive.ogg")
game.assets_manager:Load_Sound("snd_ovni_big", "sons/saucerBig.wav")
game.assets_manager:Load_Sound("snd_ovni_small", "sons/saucerSmall.wav")
game.assets_manager:Load_Sound("snd_reacteur", "sons/thrust.wav")
game.assets_manager:Load_Sound("snd_select", "sons/select.mp3")
game.assets_manager:Load_Sound("snd_tir", "sons/fire.wav")

game.assets_manager:Load_Music("msc_music", "sons/music.mp3")

game.assets_manager:Load_Video("video_highscore", "videos/gameover.ogv")
game.assets_manager:Load_Video("video_menu", "videos/menu.ogv")]]

--
player_object = game.assets_manager:Get_Object("player")
player_img = game.assets_manager:Get_Image("img_ship")
engine_img = game.assets_manager:Get_Image("img_engine")

terrain_object = game.assets_manager:Get_Object("terrain")
plateforme_object = game.assets_manager:Get_Object("plateforme")

--selection_sound = game.assets_manager:Get_Sound("snd_select")
--
--tir_sound = game.assets_manager:Get_Sound("snd_tir")

--[[font_24 = game.assets_manager:Get_Font("font_24")
font_30 = game.assets_manager:Get_Font("font_30")
font_40 = game.assets_manager:Get_Font("font_40")
font_70 = game.assets_manager:Get_Font("font_70")]]

--game_music = game.assets_manager:Get_Music("msc_music")

vdo_intro = game.assets_manager:Get_Video("video_intro")

--[[
vdo_menu = game.assets_manager:Get_Video("video_menu")
vdo_highscore = game.assets_manager:Get_Video("video_highscore")]]