
local validDebugs = {}
local invalidDebugs = {}

local debugFunctions = {
    "getconstant",
    "getconstants",
    "getinfo",
    "getproto",
    "getprotos",
    "getstack",
    "getupvalue",
    "getupvalues",
    "setconstant",
    "setstack",
    "setupvalue"
}

for _, func in ipairs(debugFunctions) do
    if debug[func] then
        table.insert(validDebugs, func)
    else
        table.insert(invalidDebugs, func)
    end
end

return {
    Valid = validDebugs,
    Invalid = invalidDebugs
}