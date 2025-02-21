local buttons = require('models/button')

local monitor = peripheral.find('monitor') or term.current()

local programs = {}

function programs.run()
    while true do
        buttons.clear()
        
        genProgramsWindow()
        local programInd = buttons.click(true)

        if programInd then
            if programInd <= 0 then
                buttons.clear()
                break
            else
                execProgram(programInd)
            end
        end
    end
end

function genProgramsWindow()
    monitor.setBackgroundColor(colors.gray)
    monitor.setTextColor(colors.white)
    monitor.clear()
    buttons.create(0,1, 1, 1, 0, 'black', '<')

    local programs = fs.list('./Local/programs')

    local xPos = 1

    for i = 1, #programs do
        local xS

        if xPos == 1 then
            xS = 1
        elseif xPos == 2 then
            xS = 11
        else
            xS = 21
        end

        local xE = xS + 8

        if xPos % 3 == 0 then
            xPos = 1
        else
            xPos =  xPos + 1
        end

        local yS
        if i / 3 <= 1 then
            yS = 2
        elseif i / 3 > 1 and i / 3 <= 2 then
            yS = 6
        elseif i / 3 > 2 and i / 3 <= 3 then
            yS = 10
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