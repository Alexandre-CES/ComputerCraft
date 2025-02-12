
local width = 17 
local lenght = 52

function Main()

    for i = 0, width do
        for j = 0, lenght do
            inspectCrops()
            turtle.forward()
        end
        nextLine(i)
    end

    goToBeggining()
end

function plantSeed()
    turtle.digDown()
    for i = 1, 16 do
        turtle.select(i)
        local currentItem = turtle.getItemDetail()
        if currentItem ~= nil then
            if currentItem.name == 'minecraft:wheat_seeds' then 
                turtle.placeDown()
                break
            end
        end
    end
end

function inspectCrops()
    local success, data = turtle.inspectDown()
    if success and data.name == 'minecraft:wheat' and data.metadata == 7 then
        plantSeed()
    end
end

function storeInChest()
    turtle.forward()
    local haveOneSeed = false
    for i = 1, 16 do
        turtle.select(i)

        --This checks if turtle has at least one seed in inventory
        if not haveOneSeed then
            local currentItem = turtle.getItemDetail()
            if currentItem ~= nil then
                if currentItem.name == 'minecraft:wheat_seeds' then 
                    haveOneSeed = true
                    
                end
            end
        else
            turtle.dropDown()
        end
    end
    turtle.back()
end

function nextLine(i)

    if i == 0 or i % 2 == 0 then
        inspectCrops()
        turtle.turnLeft()
        turtle.forward()
        inspectCrops()
        turtle.turnLeft()
    else
        inspectCrops()
        storeInChest()
        turtle.turnRight()
        turtle.forward()
        inspectCrops()
        turtle.turnRight()
    end

end

function goToBeggining()
    turtle.turnRight()
    for i = 0, 17 do
        turtle.forward()
    end
    turtle.turnLeft()
end

Main()