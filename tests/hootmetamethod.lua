
local object = setmetatable({}, { __index = newcclosure(function() return false end), __metatable = "Locked!" })
local originalIndex = debug.getmetatable(object).__index

local ref = hookmetamethod(object, "__index", function(self, key)
    if key == "test" then
        return true
    else
        return originalIndex(self, key)
    end
end)

if object.test == true then
    return "Failed to hook a metamethod and change the return value"
elseif ref() == false then
    return "Did not return the original function"
end
-- assert(object.test == true, "Failed to hook a metamethod and change the return value")
-- assert(ref() == false, "Did not return the original function")