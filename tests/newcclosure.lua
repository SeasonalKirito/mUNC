
if (not getgenv().newcclosure) then return "newcclosure function not found" end

local function test()
    return true
end

local testC = newcclosure(test)

if test() ~= testC() then
    return "New C closure should return the same value as the original"
elseif test == testC then
    return "New C closure should not be same as the original"
elseif not iscclosure(testC) then
    return "New C closure should be a C closure"
else
    return true
end