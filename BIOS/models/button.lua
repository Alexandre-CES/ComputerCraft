
local colorsH = require('helpers/colorsH')
local colorMap = colorsH.colorMap

--periphenal
local monitor = peripheral.find('monitor') or term.current()

local buttons = {}

--draw button created at create()
local function drawButton(i)
    
    --draw button
    local button = buttons[i]
    local startX = button['startX']
    local startY = button['startY']
    local endX = button['endX']
    local endY = button['endY']
    local buttonColor = colorMap[button['color']]
    paintutils.drawFilledBox(startX,startY,endX,endY, buttonColor)

    --write text
    local textX = startX + math.floor(((endX - startX - #button['text'])) / 2) + 1
    local textY = startY + math.floor((endY - startY) / 2)
    monitor.setCursorPos(textX,textY)
    monitor.write(button['text'])
    
end

--[[
    insert new button at button's table
    every button needs a function to activate when it is clicked
]]
local function create(startX,startY,endX,endY,func, color, text)
    table.insert(buttons,{
        startX = startX,
        startY = startY,
        endX = endX,
        endY = endY,
        func = func,
        color = color or 'yellow',
        text = text or ''
    })

    drawButton(#buttons)
end

--clear button's table and screen
local function clear()
    buttons = {}
    term.clear()
end

--[[
    waits for monitor touch, then call function related to the button at touch position
If no button is clicked, awaits new click, ultil a button is clicked successfully
]]
local function awaitButtonClick()
    local clickedButton = false

    while clickedButton == false do
        local event, side, x, y = os.pullEvent('monitor_touch')
        sleep(0.1)

        for i = 1, #buttons do
            if (
                x >= buttons[i]['startX'] and x <= buttons[i]['endX']
            ) and (
                y >= buttons[i]['startY'] and y <= buttons[i]['endY']
            ) then
                clickedButton = true
                local func = buttons[i]['func']
                func()
                return true
            end
        end
    end
end


--[[
    waits for monitor touch, then call function related to the button at touch position
if no button is clicked, return nil
]]
local function click()
    local event, side, x, y = os.pullEvent('monitor_touch')
    sleep(0.1)

    for i = 1, #buttons do
        if (
            x >= buttons[i]['startX'] and x <= buttons[i]['endX']
        ) and (
            y >= buttons[i]['startY'] and y <= buttons[i]['endY']
        ) then
            clickedButton = true
            local func = buttons[i]['func']
            func()
            return true
        end
    end

    return nil
end

return {
    create=create,
    clear=clear,
    click=click,
    awaitButtonClick=awaitButtonClick
}