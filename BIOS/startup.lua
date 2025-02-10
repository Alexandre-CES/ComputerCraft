--OS startup

--requires
local bars = require('models/bars')
local text = require('models/text')

--extracting models
local loadBar = bars.loadBar
local hr = text.hr

--periphenals
local monitor = peripheral.find('monitor') or term.current()
local w,h = monitor.getSize()

local function Bios()
    monitor.setBackgroundColor(colors.black)
    monitor.clear()

    monitor.setCursorPos(1,1)
    monitor.write('AlexOS')

    monitor.setCursorPos(1,2)
    hr()
    monitor.setCursorPos(1,11)
    hr()
    monitor.setCursorPos(28,12)
    monitor.write('v1')

    --loadBar(3,7, 25,3)

    --sleep(1)

    monitor.clear()
end

Bios()

--run os
local alexOS = require('alexOS/init')
alexOS.run()

--for computer reboot
monitor.setBackgroundColor(colors.black)
monitor.setTextColor(colors.white)
