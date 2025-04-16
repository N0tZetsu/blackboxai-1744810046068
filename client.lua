local ESX = nil
local hunger = 100
local thirst = 100

-- Wait for ESX
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    -- Initial HUD display
    ESX.PlayerData = ESX.GetPlayerData()
end)

-- Update HUD every second
Citizen.CreateThread(function()
    while true do
        if ESX and ESX.PlayerData then
            local data = {
                type = "updateHUD",
                money = ESX.PlayerData.money,
                bank = ESX.PlayerData.accounts[1].money, -- Bank account
                id = GetPlayerServerId(PlayerId()),
                hunger = hunger,
                thirst = thirst
            }
            
            SendNUIMessage(data)
        end
        Citizen.Wait(1000) -- Update every second
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

-- Update money on changes
RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    if account.name == 'money' then
        ESX.PlayerData.money = account.money
    elseif account.name == 'bank' then
        ESX.PlayerData.accounts[1].money = account.money
    end
end)

-- Hide default GTA HUD
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        HideHudComponentThisFrame(3) -- Cash
        HideHudComponentThisFrame(4) -- MP Cash
        HideHudComponentThisFrame(13) -- Cash Change
        SetNuiFocus(false, false)
    end
end)
