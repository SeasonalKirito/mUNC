if (not iscclosure) then return "iscclosure function not found" end

if iscclosure(print) ~= true then
    error("Function 'print' should be a C closure")
elseif iscclosure(function() end) ~= false then
    error("Executor function should not be a C closure")
else
    return true
end