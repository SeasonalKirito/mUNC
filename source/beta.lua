--<< Variables >>--
local mUNC = {
    repo = "https://raw.githubusercontent.com/SeasonalKirito/mUNC/main/",
    tests = "tests/",

    Functions = {}
}



--<< Functions >>--
function mUNC.Functions.getScript(name)
    --print(mUNC.repo .. mUNC.tests .. name .. ".lua")
    return game:HttpGet(mUNC.repo .. mUNC.tests .. name .. ".lua")
end

function mUNC.Functions.runScript(info, callback)
    local result = loadstring(mUNC.Functions.getScript(info.Name))()
    callback(result)
    return result
end



--<< Tests >>--
mUNC.Functions.runScript(
    {
        Name = "print",
        Description = "Tests the print function",
        Version = "1.0.0"
    },

    function(result)
        print(result)
    end
)

mUNC.Functions.runScript(
    {
        Name = "getgenv",
        Description = "Tests the getgenv table",
        Version = "1.0.0"
    },

    function(result)
        print(result)
    end
)

mUNC.Functions.runScript(
    {
        Name = "newcclosure",
        Description = "Tests the newcclosure function",
        Version = "1.0.0"
    },

    function(result)
        print(result)
    end
)

mUNC.Functions.runScript(
    {
        Name = "hookmetamethod",
        Description = "Tests the hookmetamethod function",
        Version = "1.0.0"
    },

    function(result)
        print(result)
    end
)