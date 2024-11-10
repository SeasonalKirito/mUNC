if getgenv then
    if (typeof(getgenv) == "function" and typeof(getgenv()) == "table") then
        return "Mr.Beast's stash of cp(cool pizza(lunchly)) (getgenv is real.)"
    else
        return "getgenv is not a function"
    end
else
    return "getgenv is not defined"
end