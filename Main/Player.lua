Player = {}
Player.__index = Player

function Player.new()
    local instance = setmetatable({},Player)
    instance.x = 0
    instance.y = 0
    instance.cellX = 0
    instance.cellY = 0
    instance.moved = {}
    return instance
end

function Player:setPosition(x,y)
    self.x = x
    self.y = y
end

function Player:draw()
    love.graphics.setColor(1,1,1,0.5)
    love.graphics.circle("fill",self.x,self.y,4*scale)
    love.graphics.setColor(1,1,0,1)
    love.graphics.circle("line",self.x,self.y,5*scale)
end

function Player:keyPress(key)
    if key == 'w' then
        self.cellY = self.cellY + 1 
        self.moved.up = true
        end
    if key == 's' then
        self.cellY = self.cellY - 1 
        self.moved.down = true
        end
    if key == 'a' then
        self.cellX = self.cellX - 1
        self.moved.left = true
        end
    if key == 'd' then
        self.cellX = self.cellX + 1
        self.moved.right = true
        end
end

function Player:update(dt)
    local dif = 0
    if self.moved.up then
       self.y = self.y - gridOffset
    end
    if self.moved.left then
        self.x = self.x - gridOffset
    end
    if self.moved.right then
        self.x = self.x + gridOffset
    end
    if self.moved.down then
        self.y = self.y + gridOffset
    end
       self.moved = {}
end

return Player