local function Rotate_Right(dt, entity)
  if love.keyboard.isDown("right") then
    entity.angle = entity.angle + (90 * dt)
    if entity.angle > 360 then entity.angle = 0 end
  end
end

local function Rotate_Left(dt, entity)
  if love.keyboard.isDown("left") then
    entity.angle = entity.angle - (90 * dt)
    if entity.angle < -360 then entity.angle = 0 end
  end
end

local function Thrust(dt, entity)
  if love.keyboard.isDown("up") then
    -- On allume le réacteur.
    entity.engine_on = true
    -- On prend en compte la rot ation du vaisseau et on l'applique à la vélocité.
    local angle_radian = math.rad(entity.angle)
    local force_x = math.sin(angle_radian) * (entity.speed * dt)
    local force_y = math.cos(angle_radian) * (entity.speed * dt)
    if math.abs(force_x) < 0.001 then force_x = 0 end
    if math.abs(force_y) < 0.001 then force_y = 0 end
    entity.vx = entity.vx + force_x
    entity.vy = entity.vy - force_y
  else
    entity.engine_on = false
  end
    
  entity.vy = entity.vy + (0.6 * dt)
  
  --On cape la vélocité.
  if math.abs(entity.vx) > 1 then
    if entity.vx > 0 then
      entity.vx = 1
    else
      entity.vx = -1
    end
  end
  if math.abs(entity.vy) > 1 then
    if entity.vy > 0 then
      entity.vy = 1
    else
      entity.vy = -1
    end
  end
  
  -- On applique la vélocité aux coordonnées du ship.
  entity.x = entity.x + entity.vx
  entity.y = entity.y + entity.vy
end



function Update_Lander(dt, entity)
  Rotate_Right(dt, entity)
  Rotate_Left(dt, entity)
  Thrust(dt, entity)
end

-----------------------------------

local player = {}

function player:Load()
  self.lander = {
    x = largeur/2,
    y = 100,
    angle = 0,
    vx = 0,
    vy = 0,
    speed = 3,
    engine_on = false,
    img = player_img,
    img_engine = engine_img,
    w = player_img:getWidth(),
    h = player_img:getHeight(),
    state = "fly"
  }
end

function player:Update(dt)
  if self.lander.state == "fly" then
    Update_Lander(dt, self.lander)
  end
end

function player:Draw()
  if self.lander.state ~= "explode" then
    love.graphics.draw(self.lander.img, self.lander.x, self.lander.y, math.rad(self.lander.angle), 1, 1, self.lander.img:getWidth()/2, self.lander.img:getHeight()/2)
    if self.lander.engine_on == true then
      love.graphics.draw(self.lander.img_engine, self.lander.x, self.lander.y, math.rad(self.lander.angle), 1, 1, self.lander.img_engine:getWidth()/2, self.lander.img_engine:getHeight()/2)
    end
  else
    love.graphics.print("BOUM", self.lander.x, self.lander.y)
  end

  local sDebug = "Debug:"
  sDebug = sDebug.." angle="..tostring(self.lander.angle)
  sDebug = sDebug.." vx="..tostring(self.lander.vx)
  sDebug = sDebug.." vy="..tostring(self.lander.vy)
  love.graphics.print(sDebug,0,0)
end

function player:Keypressed(key)
end

return player