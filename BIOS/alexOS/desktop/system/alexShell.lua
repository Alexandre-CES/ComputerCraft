
--models
local text = require('models/text')

local hr = text.hr

--helpers
local align = require('helpers/align')
local windowH = require('helpers/windowH')

--periphenals
local monitor = peripheral.find('monitor') or term.current()
local w,h = monitor.getSize()

local function Main()
    term.setBackgroundColor(colors.lightBlue)
    term.clear()
    shellWindow = generateShellWindow()
    readCommands(shellWindow)
    windowH.delete(shellWindow)
end

function readCommands(shellWindow)
    local oldWindow = term.redirect(shellWindow)

    shellWindow.setCursorPos(1,2)
    while true do

        --jump line each iteration
        local x,y = term.getCursorPos()
        shellWindow.setCursorPos(x,y)
        
        shellWindow.setTextColor(colors.yellow)
        shellWindow.write('>')
        shellWindow.setTextColor(colors.white)

        local command = read()
        if command == 'exit' or command == 'return' or command == 'back' then
            break
        elseif command == 'clear' then
            term.clear()
            generateShellWindow()
            shellWindow.setCursorPos(1,2)
        else
            shell.run(command)
        end
    end

    term.redirect(oldWindow)
end

--[[ 
    generate the window where shell is going to be placed
]]
function generateShellWindow()

    --create center window
    local startX, startY, windowWidth, windowHeight = align.getCenterOfWindow(w,h,20,9)
    local shellWindow = window.create(
        monitor,
        startX, startY,
        windowWidth, windowHeight
    )
    local oldWindow = term.redirect(shellWindow)

    --background
    shellWindow.setBackgroundColor(colors.black)
    shellWindow.clear()

    --top line
    paintutils.drawLine(1,1,windowWidth,1,colors.gray)
    shellWindow.setCursorPos(1,1)
    shellWindow.setTextColor(colors.white)
    shellWindow.write('alexShell v1')
    shellWindow.setBackgroundColor(colors.black)

    term.redirect(oldWindow)
    return shellWindow
end

return{ 
    run=Main
}