local CollectionService = game:GetService('CollectionService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Knit = require(ReplicatedStorage.Packages.Knit)

local MagicService = Knit.CreateService {
    Name = 'MagicService',
    Client = {
        MagicAdded = Knit.CreateSignal(),
        MagicRemoved = Knit.CreateSignal(),
    },
}


function MagicService:AddMagic(player: Player)
    local tool = Instance.new('Tool')
    tool.Name = 'Magic'
    tool.Parent = player.Backpack

    CollectionService:AddTag(tool, 'MagicServer')

    self.Client.MagicAdded:Fire(player, tool)
end


function MagicService:RemoveMagic(player: Player)
    local tool = player.Backpack.Magic

    CollectionService:RemoveTag(tool, 'MagicServer')

    -- When commented out, the expected behavior is for only the MagicServer component to be removed, but for some reason,
    -- the MagicClient component is also being removed.
    self.Client.MagicRemoved:Fire(player, tool)
end


return MagicService
