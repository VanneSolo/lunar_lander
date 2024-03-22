local defaite = {}

function defaite:Load()
  game:Reset()
  
  --Image de fond en cas de défaite.
  fond_defaite = fond_lose_img
  text_defaite = {}
  text_defaite.img = defaite_text_img
  text_defaite.x = -500
  text_defaite.y = 225

  text_infos = {}
  text_infos.img = text_info_img
  text_infos.x = 350
  text_infos.y = 600

  chrono_defaite_text = 3
end

function defaite:Update(dt)
  chrono_defaite_text = chrono_defaite_text - dt
  if chrono_defaite_text <= 0 then
    chrono_defaite_text = 0
    text_defaite.x = text_defaite.x + 50*dt
    if text_defaite.x >= 350/2 then
      text_defaite.x = 350/2
    end
    text_infos.y = text_infos.y - 50*dt
    if text_infos.y <= 600-230 then
      text_infos.y = 600-230
    end
  end
end

function defaite:Draw()
  love.graphics.draw(fond_defaite, 0, 0)
  
  love.graphics.draw(text_defaite.img, text_defaite.x, text_defaite.y)
  love.graphics.draw(text_infos.img, text_infos.x, text_infos.y)
end

function defaite:Keypressed(key)
  if key == "space" then
    game:Play()
  elseif key == "m" then
    game:Menu()
  elseif key == "q" then
    love.event.quit()
  end
end

function defaite:Mousepressed(x, y, button)
end

return defaite