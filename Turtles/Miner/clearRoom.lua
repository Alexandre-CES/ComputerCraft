
print('Direction: [l] [r]')
local direction = io.read()
if direction == 'l' or direction == 'r' then
else
    error('must be [l] or [r]')
    os.exit()
end

print('width: 1-100')
local width = tonumber(io.read())
if width < 1 or width > 100 then
    error('width must be between 1 and 100')
    os.exit()
end

print('length: 1-100')
local length = tonumber(io.read())
if length < 1 or length > 100 then
    error('length must be between 1 and 100')
    os.exit()
end

print('Height: 0-20')
local height = tonumber(io.read())
if height < 0 or height > 20 then
    error('Height must be between 0 and 20')
    os.exit()
end

function Main()
    local h = 0
    for i = 0, width - 1 do
        for j = 0, length - 1 do
            digColumn(h)
            h = h + 1
            goForward()
        end
        turn(i, h)
        h = h + 1
    end
end

function digColumn(h)
    if h == 0 or h % 2 == 0 then
        for i = 0, height - 1 do
            turtle.digUp()
            turtle.up()
        end
    else
        for i = 0, height - 1 do
            turtle.digDown()
            turtle.down()
        end
    end         
end

function goForward()
    --[[ Dig moving forward ]]--
    turtle.dig()
    turtle.forward()
end

function turn(i, h)

    --[[ calc which direction turtle should turn to ]]--

    --first time will be always the same
    if i == 0 or i % 2 == 0 then
        if direction == 'l' then
            turnLeftDig(h)
        else
            turnRightDig(h)
        end
    
    --after first repetion, will change between 0 and 1      
    else
        if direction == 'l' then
            turnRightDig(h)
        else
            turnLeftDig(h)
        end
    end
end

function turnLeftDig(h)
    --[[ To go backwards, but digging left first]]--
    turtle.turnLeft()
    digColumn(h)
    turtle.dig()
    turtle.forward()
    turtle.turnLeft()    
end

function turnRightDig(h)
    --[[ To go backwards, but digging right first]]--
    turtle.turnRight()
    digColumn(h)
    turtle.dig()
    turtle.forward()
    turtle.turnRight()
end

Main()
