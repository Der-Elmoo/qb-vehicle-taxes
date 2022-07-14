QBCore = exports[Config.Export]:GetCoreObject()
Citizen.CreateThread(
    function()
        while true do
            for k, playerid in pairs(QBCore.Functions.GetQBPlayers()) do
                local Player = playerid
                local citizenid = Player.PlayerData.citizenid

                if Player ~= nil then
                    local vehicleCount =
                        MySQL.Sync.fetchScalar(
                        "SELECT COUNT(plate) FROM " .. Config.SQLTableForVehicles .. " WHERE citizenid = ?",
                        {citizenid}
                    )
                    if vehicleCount >= 1 then
                        local NotifyCount = vehicleCount
                        local tax = tonumber(vehicleCount) * Config.Tax
                        Player.Functions.RemoveMoney("bank", tax)
                        if Config.Notify == "QBCore" then
                            TriggerClientEvent(
                                "QBCore:Notify",
                                Player.PlayerData.source,
                                Lang:t("notify_QbCore.message", {value = tax, value2 = NotifyCount}),
                                "success",
                                10000
                            ) -- tax, vehicleCount
                        elseif Config.Notify == "Ingame" then
                            TriggerClientEvent("taxes:notify", Player.PlayerData.source, tax, NotifyCount)
                        end
                    end
                end
            end
            Citizen.Wait(Config.Time * Config.TimeMultiplier)
        end
    end
)
