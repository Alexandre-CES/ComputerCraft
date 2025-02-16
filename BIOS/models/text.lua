
local text = {}

--create a horizontal row
function text.hr(rowWindow)
    rowWindow = rowWindow or term.current()
    local w,h = rowWindow.getSize()
    for i = 0, w do
        rowWindow.write('-')
    end
end

--create a underline horizontal rol
function text.uhr(rowWindow)
    rowWindow = rowWindow or term.current()
    local w,h = rowWindow.getSize()
    for i = 0, w do
        rowWindow.write('_')
    end
end

return text