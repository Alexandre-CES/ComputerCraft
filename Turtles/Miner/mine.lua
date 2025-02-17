print('size: 1-500: ')
local size = tonumber(io.read())
if size < 1 or size > 500 then
    error('size must be between 1 and 100')
    os.exit()
end

function Main()
    for i = 0, size - 1 do
        turtle.dig()
        turtle.digUp()
        turtle.forward()
    end
end

Main()