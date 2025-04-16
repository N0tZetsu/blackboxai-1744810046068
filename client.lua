local ESX = nil
local hunger = 100
local thirst = 100

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Update HUD every second
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        
        if ESX ~= nil and ESX.PlayerData.character ~= nil then
            local data = {
                type = "updateHUD",
                money = ESX.PlayerData.money,
                bank = ESX.PlayerData.bank,
                id = GetPlayerServerId(PlayerId()),
                hunger = hunger,
                thirst = thirst
            }
            
            SendNUIMessage(data)
        end
    end
end)

-- Register status update events
RegisterNetEvent('esx_status:update')
AddEventHandler('esx_status:update', function(status)
    for i = 1, #status do
        if status[i].name == 'hunger' then
            hunger = status[i].percent
        elseif status[i].name == 'thirst' then
            thirst = status[i].percent
        end
    end
end)

-- Display HUD
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetNuiFocus(false, false)
    end
end)
