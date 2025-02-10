
--create a horizontal row
local function hr(rowWindow)
    rowWindow = rowWindow or term.current()
    local w,h = rowWindow.getSize()
    for i = 0, w do
        rowWindow.write('-')
    end
end

--create a underline horizontal rol
local function uhr(rowWindow)
    rowWindow = rowWindow or term.current()
    local w,h = rowWindow.getSize()
    for i = 0, w do
        rowWindow.write('_')
    end
end

return {
    hr=hr,
    uhr=uhr
}