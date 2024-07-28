ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterNetEvent('bd-gramma:server:RecievedHelp', function(src)
    -- Remove the money from player
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = Config.GrammaCost
    
    xPlayer.removeAccountMoney('bank', cash)
    if Config.AmulanceJob == 'esx' then
       --('esx_ambulancejob:revive')
      --  TriggerEvent('esx_ambulancejob:revive_new')
      --  TriggerEvent('esx_ambulancejob:revive_new', source)
        xPlayer.triggerEvent('esx_ambulancejob:revive_new')
        --('esx_ambulancejob:revive_new')
       -- TriggerEvent('esx_ambulancejob:revive_new', id)
    end
end)
