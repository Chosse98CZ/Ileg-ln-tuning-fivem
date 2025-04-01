ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("illegal_tuning:useKey")
AddEventHandler("illegal_tuning:useKey", function(item)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle and GetPedInVehicleSeat(vehicle, -1) == playerPed then
        local plate = GetVehicleNumberPlateText(vehicle)

        ESX.TriggerServerCallback("illegal_tuning:hasKey", function(hasKey)
            if hasKey then
                OpenStash(plate)
            else
                ESX.ShowNotification("Tento klíč neodpovídá tomuto vozidlu!")
            end
        end, plate, item.name)
    else
        ESX.ShowNotification("Musíš být ve vozidle!")
    end
end)

function OpenStash(plate)
    -- Zde se otevře stash, např. propojení s inventářem
    TriggerEvent("inventory:openStash", plate)
end
