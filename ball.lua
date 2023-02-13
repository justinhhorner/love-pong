Ball = {}

local vel_multiplier = 5

function Ball:load()
    self.width = 20
    self.height = 20
    self.speed = 500
    self.x = love.graphics.getWidth() / 2 + self.width / 2
    self.y = love.graphics.getHeight() / 2 - self.height / 2
    self.velX = -self.speed
    self.velY = 0
end

local function center(ball)
    ball.x = love.graphics.getWidth() / 2 + ball.width / 2
    ball.y = love.graphics.getHeight() / 2 - ball.height / 2
    --ball.velY = 0
    ball.velY = math.random(ball.speed / 2, ball.speed)
    if ball.speed > 0 then
       ball.velY = -ball.speed
    end
end

function Ball:update(dt)
    self:move(dt)
    self:check_boundary_collision()
    self:check_collision()
end

function Ball:check_collision()
    if CheckCollision(self, Player) then
       self.velX = self.speed
       local middle_ball = self.y + self.height / 2
       local middle_player = Player.y + Player.height / 2
       local collision_pos = middle_ball - middle_player
       self.velY = collision_pos * vel_multiplier
    end

    if CheckCollision(self, AI) then
       self.velX = -self.speed
       local middle_ball = self.y + self.height / 2
       local middle_ai = AI.y + AI.height / 2
       local collision_pos = middle_ball - middle_ai
       self.velY = collision_pos * vel_multiplier
    end
end

function Ball:check_boundary_collision()
    if self.y <= 0 + self.height or self.y >= love.graphics.getHeight() - self.height then
        self.velY = -self.velY
    end
end

function Ball:move(dt)
    self.x = self.x + self.velX * dt
    self.y = self.y + self.velY * dt

    if self.x < 0 - self.width then
        center(self)
        self.velX = self.speed
    elseif self.x > love.graphics.getWidth() + self.width then
        center(self)
        self.velX = -self.speed
    end
end

function Ball:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

