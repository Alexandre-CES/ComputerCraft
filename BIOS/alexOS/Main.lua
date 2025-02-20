
--alexOs modules
local auth = require('alexOS/auth/login')
local desktop = require('alexOS/desktop/desktop')

--periphenals
local monitor = peripheral.find('monitor') or term.current()

local alexOS = {}

function alexOS.run()
    --auth.run()
    desktop.run()

    monitor.setBackgroundColor(colors.black)
    term.clear()
    shell.run('exit')
end

return alexOS