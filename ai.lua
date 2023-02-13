AI = {}

function AI:load()
    self.width = 20
    self.height = 100
    self.speed = 500
    self.x = love.graphics.getWidth() - 50
    self.y = love.graphics.getHeight() / 2 - self.height / 2
    self.velY = 0
    self.speed = 500

    self.follow = false
    self.follow_timer = 0
    self.follow_rate = .5
end

function AI:update(dt)
    self:update_follow_timer(dt)
    self:follow_target()
    self:move(dt)
    self:constrain()
end

function AI:update_follow_timer(dt)
    self.follow_timer = self.follow_timer + dt
    if self.follow_timer > self.follow_rate then
        self.follow_timer = 0
        self.follow = Ball.x > love.graphics.getWidth() / 2
    end
end

function AI:follow_target()
    if not self.follow then
        return
    end

    if Ball.y + Ball.height < self.y then
        self.velY = -self.speed
    elseif Ball.y > self.y + self.height then
        self.velY = self.speed
    else
        self.velY = 0
    end

    self.follow = false
end

function AI:move(dt)
    self.y = self.y + self.velY * dt
end

function AI:constrain()
    if self.y <= 0 then
        self.y = 0
    elseif self.y >= love.graphics.getHeight() - self.height then
        self.y = love.graphics.getHeight() - self.height
    end
end

function AI:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
