if (not lz4decompress) then return "lz4decompress not found" end

local randomizedString
function randomString(length)
    local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local result = ''
    for i = 1, length do
        local randIndex = math.random(1, #chars)
        result = result .. chars:sub(randIndex, randIndex)
    end
    return result
end
local success, err = pcall(function()
    randomizedString = randomString(10)
end)

if not success then
    return err
end

local compressed = lz4compress(randomizedString)
local decompressed = lz4decompress(compressed)
if decompressed == randomizedString then
    return true
else
    return "Decompressed string does not match the original string"
end