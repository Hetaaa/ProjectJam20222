local mysz = {}

function mysz:load()
  mysz.x = 0
  mysz.y = 0
end

function mysz:update(dt)
  mysz.x, mysz.y = love.mouse.getPosition()
end

return mysz
