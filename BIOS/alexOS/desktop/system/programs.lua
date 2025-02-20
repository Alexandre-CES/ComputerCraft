local buttons = require('models/button')

local monitor = peripheral.find('monitor') or term.current()

local programs = {}

function programs.run()
    while true do
        buttons.clear()
        
        genProgramsWindow()
        local programInd = buttons.click(true)

        if programInd <= 0 then
            buttons.clear()
            break
        else
            execProgram(programInd)
        end
        
    end
end

function genProgramsWindow()
    monitor.setBackgroundColor(colors.gray)
    monitor.setTextColor(colors.white)
    monitor.clear()
    buttons.create(0,1, 1, 1, 0, 'black', '<')

    local programs = fs.list('./Local/programs')

    for i = 1, #programs do
        local xS = i * 2
        local xE = xS + 8

        local yS
        if i / 3 <= 1 then
            yS = 2
        elseif i / 3 > 1 and i / 3 <= 2 then
            yS = 5
        elseif i / 3 > 2 and i / 3 <= 3 then
            yS = 8
        end

        local yE = yS + 2

        buttons.create(xS,yS, xE, yE, i, 'blue', programs[i])
    end 
end

function execProgram(programInd)
    local programs = fs.list('./Local/programs')
    local success = shell.run('./Local/programs/'..programs[programInd])

    if success then
        read('')
    end
end

return programs