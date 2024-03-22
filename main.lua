io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

love.window.setTitle("LaJamHaHaTo")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

require("mod.modules")

function love.load()
  game:Load()
end

function love.update(dt)
  game:Update(dt)
end

function love.draw()
  game:Draw()
end

function love.keypressed(key)
  game:Keypressed(key)
  
  if key == "f" then
    love.window.setFullscreen(true)
  end
  if key == "d" then
    game.debugage = not game.debugage
  end
  if key == "q" then
    --love.event.quit()
  end
  
end

function love.mousepressed(x, y, button)
  game:Mousepressed(x, y, button)
end