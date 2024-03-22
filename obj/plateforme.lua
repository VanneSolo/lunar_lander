local function Ajoute_Plateforme(x, y, lst_pf)
  local pf = {}
  pf.x = x
  pf.y = y
  pf.w = 30
  pf.h = 2
  pf.sens = love.math.random(1, 2)
  table.insert(lst_pf, pf)
end

-----------------------------------

local plateforme = {}

function plateforme:Load()
  self.liste_plateformes = {}
  
  for i=1,3 do
    Ajoute_Plateforme(love.math.random(1, largeur-30), love.math.random(150, hauteur-50), self.liste_plateformes)
  end
  --print(#)
end

function plateforme:Update(dt)
  for i=1,#self.liste_plateformes do
    local pf = self.liste_plateformes[i]
    
    if pf.sens == 1 then
      pf.x = pf.x + 30*dt
      if player_object.lander.pf == pf then
        player_object.lander.x = player_object.lander.x + 30*dt
      end
      if pf.x > largeur-pf.w then
        pf.sens = 2
      end
    else
      pf.x = pf.x - 30*dt
      if player_object.lander.pf == pf then
        player_object.lander.x = player_object.lander.x - 30*dt
      end
      if pf.x < 1 then
        pf.sens = 1
      end
    end
  end
end

function plateforme:Draw()
  for i=1,#self.liste_plateformes do
    local pf = self.liste_plateformes[i]
    love.graphics.rectangle("fill", pf.x, pf.y, pf.w, pf.h)
    love.graphics.print("Lander.y > pf.y: "..tostring(player_object.lander.y > pf.y), 5+(i-1)*150, 5+16)
    love.graphics.print("angle > 3 or angle < -3: "..tostring(player_object.lander.angle > 3 or player_object.lander.angle < -3), 5+(i-1)*250, 5+16*2)
    love.graphics.print("Lander.vy > 0.3: "..tostring(player_object.lander.vy > 0.3), 5+(i-1)*150, 5+16*3)
  end
end

return plateforme