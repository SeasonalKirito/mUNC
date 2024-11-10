if newcclosure then
    if typeof(newcclosure) == "function" then
        return true
    else
        return "newcclosure is not a function"
    end
    return "newcclosure is available"
else
    return "newcclosure is not available"
end