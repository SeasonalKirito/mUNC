
if getgenv then
    if typeof(getgenv) == "function"  then
        return true
    else
        return "getgenv is not a function"
    end
else
    return "getgenv is not defined"
end