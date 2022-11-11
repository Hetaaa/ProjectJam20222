local gracz = {}
local mysz = require "mysz"
local camera = require "camera"

function gracz:load()
  gracz.x = 500
  gracz.y = 500
  gracz.kierunek = "lewo"
  gracz.angle = 0
  gracz.color = {}
  gracz.color.red = 255
  gracz.color.green = 255
  gracz.color.blue = 255
  gracz.size = 40

  gracz.physics = {}
end

function gracz:update(dt)

  -- check angle
  gracz.center = {x=(gracz.x + gracz.size/2), y=(gracz.y + gracz.size/2)}
  gracz.angle = (math.atan2((mysz.y - gracz.center.y + camera.y), (mysz.x - gracz.center.x + camera.x)))*(180/math.pi)

  if gracz.angle < 0 then
		gracz.angle = gracz.angle + 360
	elseif gracz.angle > 180 then
		gracz.angle = gracz.angle - 360
	end

  if gracz.angle >=315 or gracz.angle <=45 then --1
		gracz.color.red = 255
		gracz.color.blue = 0
		gracz.color.green = 0
		gracz.kierunek = "prawo"

	elseif gracz.angle >= 45 and gracz.angle <= 135 then --2
		gracz.color.green = 100
		gracz.color.red = 100
		gracz.color.blue =0
		gracz.kierunek = "dol"

	elseif gracz.angle <= 315 and gracz.angle >= 225 then --3
			gracz.color.blue = 255
			gracz.color.red = 0
			gracz.color.green = 0
	  	gracz.kierunek = "gora"

	elseif gracz.angle <= 225 and gracz.angle >= 135 then --4
		gracz.color.green = 255
		gracz.color.red = 0
		gracz.color.blue = 0
		gracz.kierunek = "lewo"
end

  --movement
  if love.keyboard.isDown("a") then
		gracz.x = gracz.x - 300*dt
	end
	if love.keyboard.isDown("d") then
		gracz.x = gracz.x + 300*dt
	end
	if love.keyboard.isDown("w") then
		gracz.y = gracz.y - 300*dt
	end
	if love.keyboard.isDown("s") then
		gracz.y = gracz.y + 300*dt
	end
  print(gracz.angle)

  --kamera za graczem
  camera:setPosition(gracz.center.x-love.graphics.getWidth()/2, gracz.center.y-love.graphics.getHeight()/2)

end

function gracz:draw()
  love.graphics.print(gracz.angle ..  " "  .. gracz.kierunek)
  love.graphics.setColor(gracz.color.red, gracz.color.green, gracz.color.blue)
  love.graphics.rectangle("fill",gracz.x, gracz.y,gracz.size,gracz.size)
  love.graphics.setColor(255, 255, 255)
end

return gracz
