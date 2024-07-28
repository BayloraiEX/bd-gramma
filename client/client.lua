ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

----- | CREATING MODEL SPAWN | -----
local function FetchModel(model)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(model) do
        Wait(100)
    end
end

local LocalNPCs = {}

local function GetLocalNPC(index)
    return LocalNPCs[index]
end

local function CreateLocalNPC(index)
    if (LocalNPCs[index]) then
        DestroyLocalNPC(index)
    end

    LocalNPCs[index] = {}
    local cfg = Config.GrammaPed[index]

    FetchModel(cfg.GrammaPedModel)

    ----- | CREATING PED | -----
    local GrammaPed = CreatePed(1, cfg.GrammaPedModel, cfg.GrammaPedLocation, false, true)
    FreezeEntityPosition(GrammaPed, true)
    SetEntityInvincible(GrammaPed, true)
    SetBlockingOfNonTemporaryEvents(GrammaPed, true)
    ----- | CREATING TARGET FOR PED | -----
    LocalNPCs[index].GrammaPed = GrammaPed
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local distance = #(playerCoords - vector3(1152.3486, -431.7743, 66.0120))
    if distance <= 2.5 then
        while distance <= 2.5 do
        exports.bulletin:Send('Press E', 5000, "bottomright", "error")
        if IsControlJustReleased(0, 38) then
            TriggerEvent('bd-gramma:client:requestHelp')
        end
    end
    end
    


   --[[ exports.ox_target:addBoxZone("gramma", vector3(2810.74, 5983.58, 349.92), 1.0, 1.0, {
        name="جده شريره",
        heading=280.37,
        debugPoly=false,
        minZ= 349.92-1.5,
        maxZ= 349.92+1.5
    }, {
        options = {
            {
                event = 'bd-gramma:client:requestHelp',
                icon = 'fa-solid fa-comment-medical',
                label = 'Request Help'
                --store = Config.SellShops[i]
            }
        },
        job = 'all',
        distance = 1.5
    })
   ]] 
end

local function DestroyLocalNPC(index)
    if (LocalNPCs[index]) then
        DeleteEntity(LocalNPCs[index].GrammaPed)
        LocalNPCs[index] = nil
    end
end

----- | CHECKS IF PLAYER IS CERTAIN DISTANCE FROM PED MODEL | -----
Citizen.CreateThread(function()
    while true do
        local wait = 1000
        local ped = PlayerPedId() 
        local pcoords = GetEntityCoords(ped)
        for i=1, 1 do 
            local cfg = Config.GrammaPed[i]
            local coords = vector3(cfg.GrammaPedLocation)
            local dist = #(pcoords - coords)
            local GrammaPed = GetLocalNPC(i)
            if dist < cfg.GrammaPedRenderDistance then 
                if (GetLocalNPC(i) == nill) then 
                  CreateLocalNPC(i)
                end 
            else 
                DestroyLocalNPC(i)
            end 
        end
      Wait(wait)
    end
end)
RegisterNetEvent('bd-gramma:client:requestHelp', function()
    local PlayerData = ESX.GetPlayerData()
    local cash = ESX.GetPlayerData().accounts.Money
    local totalpay = Config.GrammaCost
    
        lib.notify({
            id = 'illegal_gramma',
            title = 'Gramma',
            description = 'Let me check your wounds for you!',
            showDuration = false,
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#FF2B2B',
                ['.description'] = {
                  color = '#909296'
                }
            },
            icon = 'house-medical',
            iconColor = '#FF2B2B'
        })
        if lib.progressCircle({
            duration = Config.ReviveTime,
            position = 'bottom',
            useWhileDead = true,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
            },
        }) then
            TriggerServerEvent('bd-gramma:server:RecievedHelp')
            lib.notify({
                id = 'illegal_gramma',
                title = 'Gramma',
                description = 'You are freshened up! I suggest changing your clothes...',
                showDuration = false,
                position = 'top',
                style = {
                    backgroundColor = '#141517',
                    color = '#FF2B2B',
                    ['.description'] = {
                      color = '#909296'
                    }
                },
                icon = 'house-medical',
                iconColor = '#FF2B2B'
            })
        else
            lib.notify({
                id = 'illegal_gramma',
                title = 'Gramma',
                description = 'You have canceled the request',
                showDuration = false,
                position = 'top',
                style = {
                    backgroundColor = '#141517',
                    color = '#FF2B2B',
                    ['.description'] = {
                      color = '#909296'
                    }
                },
                icon = 'house-medical',
                iconColor = '#FF2B2B'
            })
        end

end)
