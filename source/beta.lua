
--<< Variables >>--
local mUNC = {
    repo = "https://raw.githubusercontent.com/SeasonalKirito/mUNC/main/",
    tests = "tests/",


    Functions = {},
    TestedPositive = {}
}



--<< Functions >>--
function mUNC.Functions.getScript(name)
    --print(mUNC.repo .. mUNC.tests .. name .. ".lua")
    return game:HttpGet(mUNC.repo .. mUNC.tests .. name .. ".lua")
end

function mUNC.Functions.runScript(info, callback)
    if not info.Web then
        callback()
        return
    end
    local result = loadstring(mUNC.Functions.getScript(info.Name))()
    callback(result)
    return result
end



--<< Tests >>--
mUNC.Functions.runScript(
    {
        Name = "request",
        Description = "Tests the request function",
        Version = "1.0.0",
        Web = false
    },

    function()
        if not game.HttpGet then
            print("HttpGet is not a valid function")
            mUNC.TestedPositive["request"] = false
        else
            local response = game:HttpGet("https://httpbin.org/user-agent")
            local data = game:GetService("HttpService"):JSONDecode(response)
            print("User-Agent: " .. data["user-agent"])
            mUNC.TestedPositive["request"] = true
        end
    end
)

if not mUNC.TestedPositive["request"] then
    return
end

mUNC.Functions.runScript(
    {
        Name = "print",
        Description = "Tests the print function",
        Version = "1.0.0",
        Web = true
    },

    function(result)
        if result then
            --print("Skibidi ohio rizzler (print works 💀)")
            print("✅ Print Works 💀")
            mUNC.TestedPositive["print"] = true
        else
            mUNC.TestedPositive["print"] = false
        end
    end
)

mUNC.Functions.runScript(
    {
        Name = "debug",
        Description = "Tests the debug functions",
        Version = "1.0.0",
        Web = true
    },

    function(result)
        for _,passed in pairs(result.Valid) do
            mUNC.TestedPositive[passed] = true
            print("✅ "..passed)
        end
        for _,failed in pairs(result.Invalid) do
            mUNC.TestedPositive[failed] = false
            print("⛔ "..failed)
        end
    end
)

mUNC.Functions.runScript(
    {
        Name = "getgenv",
        Description = "Tests the getgenv table",
        Version = "1.0.0",
        Web = true
    },

    function(result)
        print(result)
    end
)

mUNC.Functions.runScript(
    {
        Name = "iscclosure",
        Description = "Tests the iscclosure function",
        Version = "1.0.0",
        Web = true
    },

    function(result)
        if result then
            print("Just work nigga (iscclosure is fine just like ur mom, oh boi that was so hard(sigma))")
            mUNC.TestedPositive["iscclosure"] = true
        end
    end
)

if mUNC.TestedPositive["iscclosure"] then
    mUNC.Functions.runScript(
        {
            Name = "newcclosure",
            Description = "Tests the newcclosure function",
            Version = "1.0.0",
            Web = true
        },

        function(result)
            if result then
                print("Beta sigma rape function (newcclosure is sigma)")
                mUNC.TestedPositive["newcclosure"] = true
            end
        end
    )
else
    print("iscclosure test failed")
end

if mUNC.TestedPositive["newcclosure"] then
    mUNC.Functions.runScript(
    {
        Name = "hookmetamethod",
        Description = "Tests the hookmetamethod function",
        Version = "1.0.0",
        Web = true
    },

    function(result)
        print(result)
    end
)
else
    print("newcclosure test failed")
end

mUNC.Functions.runScript(
    {
        Name = "lz4compress",
        Description = "Tests the lz4 compression function",
        Version = "1.0.0",
        Web = true
    },

    function(result)
        if result then
            print("✅ lz4 compression test passed")
            mUNC.TestedPositive["lz4compress"] = true
        else
            print("⛔ lz4 compression test failed")
        end
    end
)

if mUNC.TestedPositive["lz4compress"] then
    mUNC.Functions.runScript(
        {
            Name = "lz4decompress",
            Description = "Tests the lz4 decompression function",
            Version = "1.0.0",
            Web = true
        },

        function(result)
            if result then
                print("✅ lz4 decompression test passed")
                mUNC.TestedPositive["lz4decompress"] = true
            else
                print("⛔ lz4 decompression test failed")
            end
        end
    )
else
    print("lz4compress test failed")
end

-- Filesystem

mUNC.Functions.runScript(
    {
        Name = "is_make_del_folder",
        Description = "Tests the getcustomasset function",
        Version = "1.0.0",
        Web = true
    },

    function(result)
        if result then
            print("✅ Filesystem Validated [isfolder, makefolder, delfolder]")
            print("🟨 Making tests dir...")
            if isfolder(".tests") then
                delfolder(".tests")
                print("🔴 Deleted leftover .tests folder")
            end
            makefolder(".tests")
            print("✅ Done, continueing testing")
        else
            print("⛔ Filesystem Invalid")
            print("🔴 "..result)
        end
    end
)

print("\n\n\nMade by sea, lovrewe, iirzd, & ofc inspired by sens")