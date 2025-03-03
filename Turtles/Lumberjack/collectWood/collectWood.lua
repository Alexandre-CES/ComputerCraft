local width = 3


function Main()
    turtle.turnLeft()
    turtle.suck(64)
    turtle.turnRight()
    for i = 0, width do
        for j = 0, 8 do
            for i = 0, 4 do
                turtle.forward()
            end
            local success, data = turtle.inspect()
            if success then
                if data.name == 'minecraft:log' then
                    chopTree()
                else
                    moveAround()
                end
            else
                turtle.select(1)
                turtle.place()
                moveAround()
            end
        end
        if i ~= width then
            goToAnotherColumn(i)
        end
    end

    --go to chest
    for i = 0, 4 do
        turtle.forward()
    end
    turtle.turnRight()
    for i = 0, 20 do
        turtle.forward()
    end

    --drop itens in chest
    for i = 1, 15 do
        turtle.select(i)
        turtle.drop()
    end

    --reset to initial state
    turtle.turnRight()
    turtle.select(16)
    turtle.refuel(64)
    turtle.select(1)
end

function moveAround()
    --[[ To move around saplings ]]--
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
end

function chopTree()
    --[[ Chop tree, go down and forward ]]--
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    for i = 0, 3 do
        turtle.up()
        turtle.digUp()
    end
    for i = 0, 3 do
        turtle.down()
    end
    turtle.forward()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.select(1)
    turtle.place()
    turtle.turnLeft()
    turtle.turnLeft()
end

function goToAnotherColumn(d)
    --turn to direction
    if d == 0 or d % 2 == 0 then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end
    for i = 0, 6 do
        turtle.forward()
    end

    --turn back
    if d == 0 or d % 2 == 0 then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end
end

Main()
