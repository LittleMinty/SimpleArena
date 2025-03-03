Gameplay = {}

function Gameplay.load()
    love.graphics.setBackgroundColor( .6, .6, .6, 1 )
    positionsGrid = love.graphics.newCanvas( windowWidth, windowHeight )
    cellCount = 20
    gridOffset = 50*scale
    love.graphics.setCanvas(positionsGrid)
        love.graphics.clear(0, 0, 0, 0)
        love.graphics.setBlendMode('alpha')
        
        for i = -2,cellCount+2 do
            for j = -2,cellCount+2 do
                local xPos = windowWidth/2-gridOffset*(i-cellCount/2)
                local yPos = windowHeight/2-gridOffset*(j-cellCount/2)
                love.graphics.setColor(.8, .8, .8, 0.2)
                love.graphics.circle( "fill", xPos , yPos, 3*scale )
                love.graphics.setColor(1, 1, 1, 0.2)
                love.graphics.circle( "line", xPos , yPos, 2*scale )
            end
        end
    love.graphics.setCanvas()
    positionsGrid:setFilter("linear")
    p1 = Player.new()
    
    p1:setPosition(windowWidth/2,windowHeight/2)
end

function Gameplay.update(dt)
    p1:update(dt)
end

function Gameplay.draw()
    love.graphics.draw(positionsGrid , 0,0)
    p1:draw()
end

return Gameplay

