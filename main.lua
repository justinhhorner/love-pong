require('ball')
require('ai')
require('player')
require('collision')

local game_objects = { Ball, Player, AI }

local function handle_quit()
    if love.keyboard.isDown("escape") then
       love.event.quit(0)
    end
end

function love.load()
    for i = 1, #game_objects do
        game_objects[i]:load()
    end
end

function love.update(dt)
    for i = 1, #game_objects do
        game_objects[i]:update(dt)
    end

    handle_quit()
end

function love.draw()
    for i = 1, #game_objects do
        game_objects[i]:draw()
    end
end
