local buttons = require('models/button')

local monitor = peripheral.find('monitor') or term.current()

local programs = {}

local breakLoop = false

function programs.run()
    while true do
        buttons.clear()
        
        genProgramsWindow()
        buttons.click()

        if breakLoop then
            break
        end
    end
end

function genProgramsWindow()
    monitor.setBackgroundColor(colors.gray)
    monitor.clear()
    buttons.create(1,1, 2, 1, returnToDesktop, 'white', '<')
    buttons.create(2,3, 6, 5, returnToDesktop, 'blue', '<')

    
end

function returnToDesktop()
    breakLoop = true
end

return programs