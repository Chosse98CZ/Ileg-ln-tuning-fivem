ESX = exports["es_extended"]:getSharedObject()

local keys = {} -- Tabulka pro uložení klíčů během runtime

RegisterServerEvent("illegal_tuning:craftKey")
AddEventHandler("illegal_tuning:craftKey", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = Config.RequiredItem
    local amount = Config.RequiredAmount

    if xPlayer.getInventoryItem(item).count >= amount then
        xPlayer.removeInventoryItem(item, amount)
        local keyId = "key_" .. math.random(100000, 999999)
        xPlayer.addInventoryItem(keyId, 1)
        TriggerClientEvent("esx:showNotification", source, "Vyrobil jsi speciální klíč!")
    else
        TriggerClientEvent("esx:showNotification", source, "Nemáš dostatek materiálu!")
    end
end)

RegisterServerEvent("illegal_tuning:registerKey")
AddEventHandler("illegal_tuning:registerKey", function(plate, keyId)
    keys[plate] = keyId
end)

ESX.RegisterServerCallback("illegal_tuning:hasKey", function(source, cb, plate, keyId)
    if keys[plate] and keys[plate] == keyId then
        cb(true)
    else
        cb(false)
    end
end)
