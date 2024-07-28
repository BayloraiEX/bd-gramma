ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('bd-gramma:server:RecievedHelp', function(src)
    -- Remove the money from player
    local Player = ESX.GetPlayerFromId(source)
    local cash = Config.GrammaCost
    
    Player.removeMoney('cash', cash)
    if Config.AmulanceJob == 'esx' then
       -- TriggerClientEvent('esx_ambulancejob:revive', Player.source)
        Player.triggerEvent('esx_ambulancejob:revive')
    end
end)
