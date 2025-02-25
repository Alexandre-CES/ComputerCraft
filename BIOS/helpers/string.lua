
local String = {}

function String.removeExt(str)
    return str:match("(.+)%..+$") or str
end

return String