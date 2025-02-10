
local colorsH = require('helpers/colorsH')
local colorMap = colorsH.colorMap

local align = require('helpers/align')
local windowH = require('helpers/windowH')

--Create a loading bar, with a loading writen on it
--it basically creates a window, and fill it slowly with blank writes
local function loadBar(startX,startY,w,h,color1,color2)

    local c1 = colorMap[color1] or colors.white
    local c2 = colorMap[color2] or colors.red

    local loadBarWindow = window.create(term.current(), startX, startY, w, h)

    align.printCenter('Loading')

    --bar
    local barWindow = window.create(loadBarWindow, 0, 3, w, 1)

    --initial color
    barWindow.setBackgroundColor(c1)
    barWindow.clear()

    --color to fill the bar
    barWindow.setBackgroundColor(c2)

    --fill bar
    for i = 0, w do
        sleep(0.05)
        barWindow.write(' ')
    end

    windowH.delete(loadBarWindow)
end

return {
    loadBar=loadBar
}