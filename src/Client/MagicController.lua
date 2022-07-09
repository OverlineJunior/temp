local CollectionService = game:GetService('CollectionService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Knit = require(ReplicatedStorage.Packages.Knit)

local MagicController = Knit.CreateController { Name = 'MagicController' }


function MagicController:_AddMagic(tool: Tool)
    CollectionService:AddTag(tool, 'MagicClient')
end


function MagicController:_RemoveMagic(tool: Tool)
    CollectionService:RemoveTag(tool, 'MagicClient')
end


function MagicController:KnitStart()
    local MagicService = Knit.GetService('MagicService')

    MagicService.MagicAdded:Connect(function(...)
        self:_AddMagic(...)
    end)

    MagicService.MagicRemoved:Connect(function(...)
        self:_RemoveMagic(...)
    end)
end


return MagicController
