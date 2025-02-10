
--alexOs modules
local auth = require('alexOS/auth/init')
local desktop = require('alexOS/desktop/init')

--periphenals
local monitor = peripheral.find('monitor') or term.current()

function Main()
    --auth.login()
    desktop.desktop()

    monitor.setBackgroundColor(colors.black)
    term.clear()
    shell.run('exit')
end

return{
    run=Main
}