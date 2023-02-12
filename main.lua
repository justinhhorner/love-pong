require('ball')
require("player")

function love.load()
    Ball:load()
    Player:load()
end


function love.update(dt)
    Ball:update(dt)
    Player:update(dt)

    if love.keyboard.isDown("escape") then
       love.event.quit(0)
    end
end

function love.draw()
    Ball:draw()
    Player:draw()
end
