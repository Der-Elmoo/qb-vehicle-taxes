QBCore = exports[Config.Export]:GetCoreObject()

function showAdvancedNotification(tax, vehiclecount)
    AddTextEntry("VehTaxesNotification", Lang:t("notify_Ingame.message", {value = tax, value2 = vehiclecount}))
    BeginTextCommandThefeedPost("VehTaxesNotification")
    EndTextCommandThefeedPostMessagetext("CHAR_BANK_MAZE","CHAR_BANK_MAZE",false,9,Lang:t("notify_Ingame.title"),"")
end

RegisterNetEvent("taxes:notify")
AddEventHandler("taxes:notify",function(tax, vehicleCount)
    showAdvancedNotification(tax, vehicleCount)
end)
