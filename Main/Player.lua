Player = {}
Player.__index = Player

function Player.new()
    local instance = setmetatable({},Player)
    instance.x = 0
    instance.y = 0
    return instance
end

function Player:setPosition(x,y)
    self.x = x
    self.y = y
end

function Player:draw()
    love.graphics.setColor(1,1,0,1)
    love.graphics.circle("line",self.x,self.y,5*scale)
end

return Player