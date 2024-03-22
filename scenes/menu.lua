local menu = {}

function menu:Load()
  vdo_intro:getSource():stop()
  scale = Vector(game.fenetre.size.x / width, game.fenetre.size.y / height)
end

function menu:Update(dt)
end

function menu:Draw()
  --love.graphics.draw(fond_menu_img, 0, 0)
end

function menu:Keypressed(key)
  if key == "space" then
    game:Reset()
    game:Play()
  elseif key == "escape" then
    game:Window_Reset()
    self.Load()
  elseif key == "q" then
    love.event.quit()
  end
end

function menu:Mousepressed(x, y, button)
end

function menu:Resize(w,h)
  game.fenetre.size = Vector(w, h)
  
  if w > width then
    scale = Vector(game.fenetre.size.x / width, game.fenetre.size.y / height)
  end
end

return menu