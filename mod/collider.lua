function Collide(dt)
  for i=1,#plateforme_object.liste_plateformes do
    local pf = plateforme_object.liste_plateformes[i]
    
    if CheckCollision(player_object.lander.x-player_object.lander.w/2, player_object.lander.y-player_object.lander.h/2, player_object.lander.w, player_object.lander.h, pf.x, pf.y, pf.w, pf.h) then
      if player_object.lander.y > pf.y then
        game.explose_ta_gueule = true
      end
      if player_object.lander.angle > 3 or player_object.lander.angle < -3 then
        game.explose_ta_gueule = true
      end
      if player_object.lander.vy > 0.3 then
        game.explose_ta_gueule = true
      end
      if game.explose_ta_gueule == true then
        player_object.lander.state = "explode"
      end
      if game.explose_ta_gueule == false then
        player_object.lander.state = "landed"
        player_object.lander.angle = 0
        player_object.lander.y = pf.y - player_object.lander.h/2
        player_object.lander.engineOn = false
        player_object.lander.pf = pf
      end
    end
  end
end