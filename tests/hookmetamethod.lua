
local object = setmetatable({}, { __index = function() return false end, __metatable = "Locked!" })
local originalIndex = debug.getmetatable(object).__index

local ref = hookmetamethod(object, "__index", function(self, key)
    if key == "test" then
        return true
    elseif key == "anotherTest" then
        return "anotherValue"
    else
        return originalIndex(self, key)
    end
end)

if object.test ~= true then
    return "Failed to hook a metamethod and change the return value"
elseif object.anotherTest ~= "anotherValue" then
    return "Failed to hook a metamethod and change the return value for anotherTest"
elseif ref() ~= false then
    return "Did not return the original function"
elseif debug.getmetatable(object).__metatable ~= "Locked!" then
    return "Failed to lock the metatable"
else
    return "Sigma patrick bateman moment (ur hookmetamethod shi works)"
end