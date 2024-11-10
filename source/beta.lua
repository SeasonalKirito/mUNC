local repo = "https://raw.githubusercontent.com/SeasonalKirito/mUNC/main/"
local tests = "tests/"

local function getScript(name)
    return game:HttpGet(repo .. name)
end

local function runScript(name)
    loadstring(getScript(name))()
end

runScript(tests .. "hootmetamethod.lua")