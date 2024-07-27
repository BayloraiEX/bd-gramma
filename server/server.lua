local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('bd-gramma:server:RecievedHelp', function(src)
    -- Remove the money from player
    local Player = QBCore.Functions.GetPlayer(source)
    local cash = Config.GrammaCost
    
    Player.Functions.RemoveMoney('cash', cash)
    if Config.AmulanceJob == 'qb' then
        TriggerClientEvent('hospital:client:Revive', Player.PlayerData.source)
    elseif Config.AmulanceJob == 'ars' then
        TriggerClientEvent('ars_ambulancejob:healPlayer', {revive = true})
    end
end)