

local success, error = pcall(function()
    local old
    old = hookmetamethod(game,"__index",function(self,key)
        if self == game.Players.LocalPlayer.Character.Humanoid and key == "WalkSpeed" then
            return 10.5
        end
        return old(self,key)
    end)
end)

if not success then
    warn("An error occurred: " .. error)
end

if success then
    warn("Hooked!")
    warn(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed)
    if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 10.5 then
        warn("Return Worked!")
    else
        warn("Failed to return!")
    end
end