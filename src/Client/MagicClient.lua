local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Component = require(ReplicatedStorage.Packages.Component)

local MagicClient = Component.new { Tag = 'MagicClient' }


function MagicClient:Construct()
    print('MagicClient constructed')
end


function MagicClient:Stop()
    print('MagicClient stopped')
end


return MagicClient
