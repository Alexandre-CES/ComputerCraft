--Login

--Require
local usersData = require('alexOS/auth/data/usersData')
local align = require('helpers/align')
local windowH = require('helpers/windowH')
local text = require('models/text')

--extracting models
local uhr = text.uhr

--monitor
local monitor = term.current()
local w,h = monitor.getSize()

local login = {}

--Create login screan
function login.run()

    term.setBackgroundColor(colors.lightBlue)
    term.clear()
    
    --repeat til login succeed
    while true do
        loginWindow = genLoginScreen()
        local user, password = inputUser(loginWindow)
        local success = checkUserPassword(user,password)
        if success then
            --welcomes you
            term.setTextColor(colors.black)
            term.setCursorPos(1,2)
            align.printCenter('     ')
            align.slowPrintCenter('Welcome!')
            sleep(1)
            windowH.delete(loginWindow)
            break
        else
            term.setTextColor(colors.red)
            term.setCursorPos(1,2)
            align.printCenter('Wrong')
        end
    end

    --reset colors
    term.setTextColor(colors.white)
    term.setBackgroundColor(colors.black)
end

--search users and passwords of userData til either finds matching values or til the end
--return true for success and false for failure
function checkUserPassword(user,password)
    for i = 0, table.maxn(usersData) do
        if usersData[i]['user'] == user and usersData[i]['password'] == password then
            return true
        end
    end
    return false
end

--read input user and password, returning his values
function inputUser(loginWindow)
    local oldWindow = term.redirect(loginWindow)

    loginWindow.setTextColor(colors.white)
    loginWindow.setCursorPos(12,3)
    local user = read()
    loginWindow.setCursorPos(12,5)
    local password = read('*')

    term.redirect(oldWindow)

    return user, password
end

--generate full style of login screen
function genLoginScreen()
    local startX, startY, windowWidth, windowHeight = align.getCenterOfWindow(w,h,20,6)

    --create login window
    local loginWindow = window.create(
        term.current(),
        startX, startY,
        windowWidth, windowHeight
    )

    local oldWindow = term.redirect(loginWindow)

    --background
    loginWindow.setBackgroundColor(colors.gray)
    loginWindow.clear()

    --top line
    loginWindow.setCursorPos(1,1)
    paintutils.drawLine(1,1,windowWidth,1, colors.lightGray)

    --username style
    loginWindow.setBackgroundColor(colors.gray)
    loginWindow.setTextColor(colors.yellow)
    loginWindow.setCursorPos(2,3)
    loginWindow.write('username: ')
    paintutils.drawLine(12,3,windowWidth-1,3, colors.black)

    --password style
    loginWindow.setBackgroundColor(colors.gray)
    loginWindow.setTextColor(colors.yellow)
    loginWindow.setCursorPos(2,5)
    loginWindow.write('password: ')
    paintutils.drawLine(12,5,windowWidth-1,5, colors.black)

    term.redirect(oldWindow)

    return loginWindow
end

return login