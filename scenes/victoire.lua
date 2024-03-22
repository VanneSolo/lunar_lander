-- To do: adapter ce fichier et le defaite.lua pour le lunar lander

local victoire = {}

function victoire:Load()
  game:Reset()
  
  hero = {}
  hero.img = bonhomme_win_img
  hero.x = 850
  hero.y = 330
  timer_hero = 1
  timer_recul = 1
  hero.pose_bombe = false
  hero.off_screen = false

  bombe = {}
  bombe.img = bombe_img
  bombe.x = hero.x - 15
  bombe.y = hero.y + 25

  boum = Create_Explosion()
  win_text = {}
  win_text.img = win_text_img
  win_text.x = 350/2
  win_text.y = -150

  text_infos = {}
  text_infos.img = text_info_img
  text_infos.x = 800
  text_infos.y = 0

  --Chargement des images de la scène de victoire.
  fond_win = fond_win_img
  citerne = citerne_img
  usine = usine_img

  key_victory_screen = false
end

function victoire:Update(dt)
  timer_hero = timer_hero - dt
  if timer_hero <= 0 then
    timer_hero = 0
    hero.x = hero.x - 70*dt
    bombe.x = bombe.x - 70*dt
    if hero.x <= 350 then
      hero.x = 350
      bombe.x = hero.x-15
      hero.pose_bombe = true
    end
  end
  
  if hero.pose_bombe then
    timer_recul = timer_recul - dt
    if timer_recul <= 0 then
      timer_recul = 0
      bombe.x = 335
      hero.x = hero.x + 140*dt
      if hero.x >= 800 then
        hero.x = 800
        hero.off_screen = true
      end
    end
  end
  
  if hero.off_screen then
    boum.current_img = boum.current_img + 12*dt
    if boum.current_img > 4.9 then
      boum.current_img = 1
    end
    key_victory_screen = true
    win_text.y = win_text.y + 25*dt
    if win_text.y >= 10 then
      win_text.y = 10
    end
    text_infos.x = text_infos.x - 25*dt
    if text_infos.x <= 800-150 then
      text_infos.x = 800-150
    end
  end
  
end

function victoire:Draw()
  love.graphics.draw(fond_win, 0, 0)
  love.graphics.draw(usine, 10, 320)
  love.graphics.draw(usine, 260, 320)
  love.graphics.draw(citerne, 20, 140)
  love.graphics.draw(citerne, 210, 140)
  love.graphics.draw(bombe.img, bombe.x, bombe.y)
  love.graphics.draw(hero.img, hero.x, hero.y)
  if hero.off_screen then
    local img = math.floor(boum.current_img)
    love.graphics.draw(boum.lst_explosions[img], boum.x+15, boum.y-10)
    love.graphics.draw(boum.lst_explosions[img], -170, 80)
  end
  
  love.graphics.draw(win_text.img, win_text.x, win_text.y)
  love.graphics.draw(text_infos.img, text_infos.x, text_infos.y)
end

function victoire:Keypressed(key)
  if key == "space" then
    game:Play()
  elseif key == "m" then
    game:Menu()
  elseif key == "q" then
    love.event.quit()
  end
end

function victoire:Mousepressed(x, y, button)
end

return victoire