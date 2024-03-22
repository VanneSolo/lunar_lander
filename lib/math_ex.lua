function Clamp(valeur, minimum, maximum)
  return math.max(minimum, math.min(valeur, maximum))
end

function math.angle(x1,y1, x2,y2) 
  return math.atan2(y2-y1, x2-x1) 
end

function math.Angle_Vector(vec_1, vec_2) 
  return math.atan2(vec_2.y-vec_1.y, vec_2.x-vec_1.x) 
end

function math.dist(x1,y1, x2,y2) 
  return ((x2-x1)^2+(y2-y1)^2)^0.5 
end

function math.Dist_Vector(vec_1, vec_2) 
  return ((vec_2.x-vec_1.x)^2+(vec_2.y-vec_1.y)^2)^0.5 
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end