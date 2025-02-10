local alexShell = require('alexOS/desktop/system/alexShell')
local programs = require('alexOS/desktop/system/programs')

return {
    alexShell=alexShell.run,
    programs=programs.run
}