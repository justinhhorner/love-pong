Ball = {}

function Ball:load()
    self.width = 20
    self.height = 20
    self.speed = 800
    self.x = love.graphics.getWidth() / 2 + self.width / 2
    self.y = love.graphics.getHeight() / 2 - self.height / 2
    self.velX = 0 
    self.velY = -100
end

function Ball:update(dt)
    self:move(dt)
    self:constrain_movement()
end

function Ball:move(dt)
    self.x = self.x + self.velX * dt
    self.y = self.y + self.velY * dt
end

function Ball:constrain_movement()
    if self.x <= 0 then
        -- TODO: CPU score
    elseif self.x >= love.graphics.getWidth() + self.width then
        -- TODO: Player score
    end

    if self.y <= 0 + self.height or self.y >= love.graphics.getHeight() - self.height then
        self.velY = -self.velY
    end
end

function Ball:draw()
    love.graphics.circle('fill', self.x, self.y, self.width, self.height)
end
