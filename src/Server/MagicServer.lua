local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Component = require(ReplicatedStorage.Packages.Component)

local MagicServer = Component.new { Tag = 'MagicServer' }


function MagicServer:Construct()
    print('MagicServer constructed')
end


function MagicServer:Stop()
    print('MagicServer stopped')
end


return MagicServer
