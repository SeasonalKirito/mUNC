if (not lz4compress) then return "lz4compress not found" end

local compressed = lz4compress("Hello, world!")
if typeof(compressed) ~= "string" then
    return "lz4compress did not return a string"
else
    return true
end