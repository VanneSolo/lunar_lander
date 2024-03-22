local game = {
  fenetre = {size=Vector(800, 600), fullscreen=false},
  assets_manager = require("lib.assets_manager"),
  current_state = "intro",
  chrono = 25,
  explose_ta_gueule = false,
  debugage = false
}

function game:Load()
  math.randomseed(os.time())
  LG.setDefaultFilter("linear", "linear", 8)
  LW.setFullscreen(self.fenetre.fullscreen)
  
  --game_music:setVolume(0.3)
  --game_music:setLooping(true)
  self.timer = self.chrono
  self:Intro()
end

function game:Update(dt)
  if self.current_state == "intro" then intro:Update(dt)
  elseif self.current_state == "menu" then menu:Update(dt)
  elseif self.current_state == "play" then print(game.explose_ta_gueule)
  elseif self.current_state == "victoire" then victoire:Update(dt)
  elseif self.current_state == "defaite" then defaite:Update(dt) end
end

function game:Draw()
  if self.current_state == "intro" then intro:Draw()
  elseif self.current_state == "menu" then menu:Draw()
  elseif self.current_state == "play" then play:Draw()
  elseif self.current_state == "victoire" then victoire:Draw()
  elseif self.current_state == "defaite" then defaite:Draw() end
end

function game:Keypressed(key)
  if self.current_state == "intro" then intro:Keypressed(key)
  elseif self.current_state == "menu" then menu:Keypressed(key)
  elseif self.current_state == "play" then play:Keypressed(key)
  elseif self.current_state == "victoire" then victoire:Keypressed(key)
  elseif self.current_state == "defaite" then defaite:Keypressed(key) end
end

function game:Mousepressed(x, y, button)
  if self.current_state == "intro" then intro:Mousepressed(x, y, button)
  elseif self.current_state == "menu" then menu:Mousepressed(x, y, button)
  elseif self.current_state == "play" then play:Mousepressed(x, y, button)
  elseif self.current_state == "victoire" then victoire:Mousepressed(x, y, button)
  elseif self.current_state == "defaite" then defaite:Mousepressed(x, y, button) end
end

function game:Resize(w, h)
  if self.current_state == "intro" then intro:Resize(w, h)
  elseif self.current_state == "menu" then menu:Resize(w, h)
  elseif self.current_state == "play" then play:Resize(w, h)
  elseif self.current_state == "victoire" then victoire:Resize(w, h)
  elseif self.current_state == "defaite" then defaite:Resize(w, h) end
end

function game:Intro()
  self.current_state = "intro"
  intro:Load()
end

function game:Menu()
  self.current_state = "menu"
  menu:Load()
end

function game:Play()
  self.current_state = "play"
  play:Load()
end

function game:Victoire()
  self.current_state = "victoire"
  victoire:Load()
end

function game:Defaite()
  self.current_state = "defaite"
  defaite:Load()
end

function game:Reset()
  
end

function game:Window_Reset()
  self.fenetre.size = Vector(800, 600)
  self.fenetre.fullscreen = false
  LW.setFullscreen(false)
end

return game