-- functions related to windows

local function delete(window)
    --[[config everything in a screen to seens deleted]]
    window.setBackgroundColor(colors.lightBlue)
    window.clear()
    window.setVisible(false)
    return nil
end

return{
    delete=delete
}