-- lunar lander avec la fusée qui peut coller au pad d'attrrissage.

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

local Lander = {}
Lander.x = 0
Lander.y = 0
Lander.angle = 0
Lander.vx = 0
Lander.vy = 0
Lander.speed = 3
Lander.engineOn = false
Lander.img = love.graphics.newImage("images/ship.png")
Lander.imgEngine = love.graphics.newImage("images/engine.png")
Lander.w = Lander.img:getWidth()
Lander.h = Lander.img:getHeight()

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  Lander.x = largeur/2
  Lander.y = hauteur/2
  Lander.current_state = "fly"
  
  liste_plateformes = {}
  
  for i=1,3 do
    Ajoute_Plateforme(love.math.random(1, largeur-30), love.math.random(150, hauteur-50))
  end
end

function love.update(dt)
  if Lander.current_state == "fly" then
    Update_Lander(dt)
  end
  
  for i=1,#liste_plateformes do
    local pf = liste_plateformes[i]
    
    if pf.sens == 1 then
      pf.x = pf.x + 30*dt
      if Lander.pf == pf then
        Lander.x = Lander.x + 30*dt
      end
      if pf.x > largeur-pf.w then
        pf.sens = 2
      end
    else
      pf.x = pf.x - 30*dt
      if Lander.pf == pf then
        Lander.x = Lander.x - 30*dt
      end
      if pf.x < 1 then
        pf.sens = 1
      end
    end
    
    if CheckCollision(Lander.x-Lander.w/2, Lander.y-Lander.h/2, Lander.w, Lander.h, pf.x, pf.y, pf.w, pf.h) then
      local b_explose_ta_gueule = false
      if Lander.y > pf.y then
        b_explose_ta_gueule = true
      end
      if Lander.angle > 3 or Lander.angle < -3 then
        b_explose_ta_gueule = true
      end
      if Lander.vy > 0.3 then
        b_explose_ta_gueule = true
      end
      if b_explose_ta_gueule == true then
        Lander.current_state = "explode"
      end
      if b_explose_ta_gueule == false then
        Lander.current_state = "landed"
        Lander.angle = 0
        Lander.y = pf.y - Lander.h/2
        Lander.engineOn = false
        Lander.pf = pf
      end
    end
  end
end

function love.draw()
  for i=1,#liste_plateformes do
    local pf = liste_plateformes[i]
    love.graphics.rectangle("fill", pf.x, pf.y, pf.w, pf.h)
    love.graphics.print("Lander.y > pf.y: "..tostring(Lander.y > pf.y), 5+(i-1)*150, 5+16)
    love.graphics.print("angle > 3 or angle < -3: "..tostring(Lander.angle > 3 or Lander.angle < -3), 5+(i-1)*250, 5+16*2)
    love.graphics.print("Lander.vy > 0.3: "..tostring(Lander.vy > 0.3), 5+(i-1)*150, 5+16*3)
  end
  
  if Lander.current_state ~= "explode" then
    love.graphics.draw(Lander.img, Lander.x, Lander.y, math.rad(Lander.angle), 1, 1, Lander.img:getWidth()/2, Lander.img:getHeight()/2)
    if Lander.engineOn == true then
      love.graphics.draw(Lander.imgEngine, Lander.x, Lander.y, math.rad(Lander.angle), 1, 1, Lander.imgEngine:getWidth()/2, Lander.imgEngine:getHeight()/2)
    end
  else
    love.graphics.print("BOUM", Lander.x, Lander.y)
  end
  
  local sDebug = "Debug:"
  sDebug = sDebug.." angle="..tostring(Lander.angle)
  sDebug = sDebug.." vx="..tostring(Lander.vx)
  sDebug = sDebug.." vy="..tostring(Lander.vy)
  love.graphics.print(sDebug,0,0)
  
end

function Ajoute_Plateforme(x, y)
  local pf = {}
  pf.x = x
  pf.y = y
  pf.w = 30
  pf.h = 2
  pf.sens = love.math.random(1, 2)
  table.insert(liste_plateformes, pf)
end

function Update_Lander(dt)
  if love.keyboard.isDown("right") then
    Lander.angle = Lander.angle + (90 * dt)
    if Lander.angle > 360 then Lander.angle = 0 end
  end
  if love.keyboard.isDown("left") then
    Lander.angle = Lander.angle - (90 * dt)
    if Lander.angle < -360 then Lander.angle = 0 end
  end
  if love.keyboard.isDown("up") then
    Lander.engineOn = true
    
    local angle_radian = math.rad(Lander.angle)
    local force_x = math.sin(angle_radian) * (Lander.speed * dt)
    local force_y = math.cos(angle_radian) * (Lander.speed * dt)
    if math.abs(force_x) < 0.001 then force_x = 0 end
    if math.abs(force_y) < 0.001 then force_y = 0 end
    Lander.vx = Lander.vx + force_x
    Lander.vy = Lander.vy - force_y
  else
    Lander.engineOn = false
  end
    
  Lander.vy = Lander.vy + (0.6 * dt)

  if math.abs(Lander.vx) > 1 then
    if Lander.vx > 0 then
      Lander.vx = 1
    else
      Lander.vx = -1
    end
  end
  if math.abs(Lander.vy) > 1 then
    if Lander.vy > 0 then
      Lander.vy = 1
    else
      Lander.vy = -1
    end
  end

  Lander.x = Lander.x + Lander.vx
  Lander.y = Lander.y + Lander.vy
end

--[[_______________________________________________________________________________________
___________________________________________________________________________________________

    -- Génération de terrain montagneux pour relier les pads.

io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

liste_points = {}

function Genere()
  liste_points = {}
  local p1 = {x=0, y=love.math.random(250, 350)}
  local p2 = {x=largeur, y=love.math.random(200, p1.y)}
  table.insert(liste_points, p1)
  table.insert(liste_points, p2)
  
  local iteration = 5
  disp = (p1.y + p2.y)/2
  for i=1,iteration do
    local copie = {}
    for k,v in pairs(liste_points) do
      table.insert(copie, v)
    end
    for i=1,#copie-1 do
      local p1 = copie[i]
      local p2 = copie[i+1]
      local m = (p1.y+p2.y)/2
      local p3 = { x = p1.x+(p2.x-p1.x)/2, y = love.math.random(m-disp, m+disp) }
      table.insert(liste_points, 2*i, p3)
    end
    disp = disp*2^(-0.9)
  end
end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  love.graphics.setPointSize(3)
  
  Genere()
end

function love.update(dt)
  
end

function love.draw()
  local liste = {}
  for k,v in pairs(liste_points) do
    table.insert(liste, v.x)
    table.insert(liste, v.y)
  end
  love.graphics.line(liste)
end

function love.keypressed(key)
  if key == "space" then
    Genere()
  end
end

]]