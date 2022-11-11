local gracz = require "gracz"
local mysz = require "mysz"
local camera = require "camera"

function love.load(arg)
  gracz:load()
  mysz:load()
  pakosz = love.graphics.newImage("assets/pakosz.jpg")
end

function love.update(dt)
  gracz:update(dt)
  mysz:update(dt)
end

function love.draw()
  camera:set()
  gracz:draw()
  love.graphics.draw(pakosz, 100, 100, 0, 0.25, 0.25)
  camera:unset()
end
