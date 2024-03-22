-- A VIRER

--Chargement des images de l'explosion.
  
function Create_Explosion() -- A transformer en fonction de création d'une animation.
  local boum = {}
  boum.x = 50
  boum.y = 170
  boum.lst_explosions = {}
  for i=1,4 do
    local img = love.graphics.newImage("img_jam/explosion_"..i..".png")
    table.insert(boum.lst_explosions, img)
  end
  boum.current_img = 1
  return boum
end

function Reset_Game(scene, player, soldat, bullet)
  player.pv = 1200
  
  game.current_scene = scene
  bullet.player = {}
  bullet.soldats = {}
  soldat.liste = {}
  
  spawn_soldat = 1
  timer_niveau = chrono
  
  hero.x = 850
  hero.y = 330
  timer_hero = 1
  timer_recul = 1
  hero.pose_bombe = false
  hero.off_screen = false
  bombe.x = hero.x - 15
  bombe.y = hero.y + 25
  
  text_defaite.x = -500
  text_defaite.y = 225

  key_victory_screen = false
  
  chrono_defaite_text = 3
  win_text.y = -150
  text_infos.x = 800
  text_infos.y = 0
end