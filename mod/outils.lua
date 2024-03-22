function Wrap_Around(obj)
  if obj.transform.move.x > game.fenetre.size.x  then
    obj.transform.move.x = 0
  elseif obj.transform.move.x < 0 then
    obj.transform.move.x = game.fenetre.size.x
  end
  
  if obj.transform.move.y > game.fenetre.size.y then
    obj.transform.move.y = 0
  elseif obj.transform.move.y < 0 then
    obj.transform.move.y = game.fenetre.size.y
  end
end

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