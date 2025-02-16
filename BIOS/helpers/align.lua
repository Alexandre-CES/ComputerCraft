--functions related to align things

local align = {}

function align.printCenter(text, actualWindow)
    --[[ receive a text and print it in the x center of screen
    it takes a optional argument actualWindow, so you can center the text at any window ]]
    
    actualWindow = actualWindow or term.current()
    local x, y = actualWindow.getCursorPos()
    local width, height = actualWindow.getSize()
    actualWindow.setCursorPos(math.floor((width - #text) / 2) + 1, y)
    actualWindow.write(text)
end

function align.slowPrintCenter(text,actualWindow)
    --[[same as print center, but it print slower]]

    actualWindow = actualWindow or term.current()
    local x, y = actualWindow.getCursorPos()
    local width, height = actualWindow.getSize()
    actualWindow.setCursorPos(math.floor((width - #text) / 2) + 1, y)
    for i = 0, #text do
        sleep(0.1)
        actualWindow.write(string.sub(text, i, i))
    end
end

--[[ 
Return the x's and y's starting points to center a new window
    if you pass header(boolean) = true, you will get +1 of window's y axis
]]
function align.getCenterOfWindow(parentWidth,parentHeight, w, h)

    local startX = math.floor((parentWidth - w) / 2 + 1)
    local startY = math.floor((parentHeight - h) / 2 + 1)

    return startX, startY, w, h
end

return align