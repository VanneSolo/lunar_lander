local play = {}

function play:Load()
  for i,v in ipairs(game.assets_manager:Get_Objects()) do
    v:Load()
  end
end

function play:Update(dt)
  for i,v in ipairs(game.assets_manager:Get_Objects()) do
    v:Update(dt)
  end
  
  Collide(dt)
end

function play:Draw()
  for i,v in ipairs(game.assets_manager:Get_Objects()) do
    v:Draw()
  end
end

function play:Keypressed(key)
  if key == "escape" then game:Window_Reset() end
end

function play:Mousepressed(x, y, button)
  player_object:Mousepressed(x, y, button)
end

return play