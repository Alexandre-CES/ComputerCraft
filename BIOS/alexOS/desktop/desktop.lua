
--desktop modules
local system = require('alexOS/desktop/system/init')

--periphenals
local monitor = peripheral.find('monitor') or term.current()
local w,h = monitor.getSize()

--models
local button = require('models/button')

--helpers
local align = require('helpers/align')

local turnOff = nil

local function Main()
    
    while true do
        term.setBackgroundColor(colors.lightBlue)
        term.clear()
        paintutils.drawLine(1,h,w,h, colors.gray)

        --turn off computer
        button.create(1,h,2,h,turningComputerOff,'red','I')

        button.create(2,2,8,4,system.alexShell,'gray', 'shell')
        button.create(11,2,19,4,system.programs,'gray', 'programs')
        button.create(22,2,28,4,system.alexShell,'gray', 'empty')

        button.create(2,6,8,8,system.alexShell,'gray', '     ')
        button.create(11,6,19,8,system.alexShell,'gray', '     ')
        button.create(22,6,28,8,system.alexShell,'gray', '     ')

        button.click()

        --if turnOff button is clicked, exit this Main
        if turnOff then
            break
        end
    end
    
end

function turningComputerOff()
    turnOff = true
    
    term.setBackgroundColor(colors.gray)
    term.setTextColor(colors.white)
    term.clear()

    term.setCursorPos(1,h/2)
    align.slowPrintCenter('Bye!')
    sleep(1)
end

return{
    run=Main
}