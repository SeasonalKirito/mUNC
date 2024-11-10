
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
        if not (request or http and (http.request or http_request)) then
            print("Request functions are not available")
        else
            local response = request({
                Url = "https://httpbin.org/user-agent",
                Method = "GET",
            })
            if type(response) ~= "table" then
                print("Response must be a table")
            elseif response.StatusCode ~= 200 then
                print("Did not return a 200 status code")
            else
                local data = game:GetService("HttpService"):JSONDecode(response.Body)
                if type(data) ~= "table" or type(data["user-agent"]) ~= "string" then
                    print("Did not return a table with a user-agent key")
                else
                    print("User-Agent: " .. data["user-agent"])
                    mUNC.TestedPositive["request"] = true
                end
            end
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
        print(result)
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