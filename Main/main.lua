local _, _, flags = love.window.getMode()
desktopWidth, desktopHeight = love.window.getDesktopDimensions(flags.display)
scale = 1
function processResolution(ID)
    if ID == 0 then
        windowWidth , windowHeight = 320 , 240
    elseif ID == 1 then
        windowWidth , windowHeight = 640 , 480
    elseif ID == 3 then
        windowWidth , windowHeight = 960 , 720
    elseif ID == 4 then
        windowWidth , windowHeight = 1024 , 768
    elseif ID == 5 then
        windowWidth , windowHeight = 1028 , 960
    elseif ID == 6 then
        windowWidth , windowHeight = 1920 , 1440
    elseif ID == 7 then
        windowWidth , windowHeight = 2048 , 1536
    else
        windowWidth , windowHeight = nil,nil
    end
    
    if windowWidth and windowHeight then
        scale = windowWidth/800
        love.window.setMode( windowWidth, windowHeight) 
    end
end

function love.quit()
    dataToWrite = contents:sub(2) or ""
    dataToWrite = resolutionID..dataToWrite
    success, message = love.filesystem.write( "saveState", dataToWrite)
end

function love.load()
    
    if not love.filesystem.getInfo( "saveState", "file" ) then
        love.filesystem.write( "saveState", "")
    end
    
    contents, size = love.filesystem.read( "saveState")
    if desktopWidth > desktopHeight then
        if desktopHeight < 480 then
            resolutionID = 0
        elseif desktopHeight < 600 then
            resolutionID = 1
        else
            resolutionID = 2
        end
    else
        if desktopWidth < 640 then
            resolutionID = 0
        elseif desktopWidth < 800 then
            resolutionID = 1 
        else
            resolutionID = 2
        end
    end
    
    resolutionID = tonumber(contents:sub(1,1)) or resolutionID
    processResolution(resolutionID)
    print(resolutionID)
    print(scale)
end

--temp
function love.keypressed(key,scancode,isrepeat)
    if key == '2' then
        resolutionID = 2
    elseif key == '0' then
        resolutionID = 0
    elseif key == '4' then
        resolutionID = 4
    end
end
