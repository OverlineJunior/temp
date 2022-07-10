local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Players = game:GetService('Players')
local ServerStorage = game:GetService('ServerStorage')

local Knit = require(ReplicatedStorage.Packages.Knit)
local TableUtil = require(ReplicatedStorage.Packages.TableUtil)

local server = ServerStorage.Server:GetDescendants()
local serverShared = TableUtil.Extend(ReplicatedStorage.Shared:GetDescendants(), server)

for _, v in ipairs(server) do
    if v:IsA('ModuleScript') and v.Name:match('Service$') then
        require(v)
    end
end

Knit.Start():andThen(function()
    for _, v in ipairs(serverShared) do
        if v:IsA('ModuleScript') then
            require(v)
        end
    end
end):catch(warn)


local function OnPlayerAdded(player: Player)
    local MagicService = Knit.GetService('MagicService')

    if not player:HasAppearanceLoaded() then
        player.CharacterAppearanceLoaded:Wait()
    end

    MagicService:AddMagic(player)
    task.wait()
    MagicService:RemoveMagic(player)
end


Players.PlayerAdded:Connect(OnPlayerAdded)
