local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Knit = require(ReplicatedStorage.Packages.Knit)
local TableUtil = require(ReplicatedStorage.Packages.TableUtil)

local client = ReplicatedStorage.Client:GetDescendants()
local clientShared = TableUtil.Extend(ReplicatedStorage.Shared:GetDescendants(), client)

for _, v in ipairs(client) do
    if v:IsA('ModuleScript') and v.Name:match('Controller$') then
        require(v)
    end
end

Knit.Start():andThen(function()
    for _, v in ipairs(clientShared) do
        if v:IsA('ModuleScript') then
            require(v)
        end
    end
end):catch(warn)
