local CollectionService = game:GetService('CollectionService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Knit = require(ReplicatedStorage.Packages.Knit)

local MagicService = Knit.CreateService { Name = 'MagicService' }


function MagicService:AddMagic(player: Player)
    local tool = Instance.new('Tool')
    tool.Name = 'Magic'
    tool.Parent = player.Backpack

    CollectionService:AddTag(tool, 'Magic')
end


function MagicService:RemoveMagic(player: Player)
    local tool = player.Backpack.Magic

    CollectionService:RemoveTag(tool, 'Magic')
end


return MagicService
