local lastDamage = 0.0

CreateThread(function()
    local sleep = 1000
    local playerPed = PlayerPedId()
    while true do
        if IsPedInAnyVehicle(playerPed) then
            sleep = 100
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local shakeRate = GetEntitySpeed(vehicle) / 250.0 -- 250.0 Normal Shake / 100.0 High Shake / 50.0 Maximum Shake
            local curHealth = GetVehicleBodyHealth(vehicle)
            if curHealth ~= lastDamage then
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", shakeRate)
                lastDamage = curHealth
            end
        else
            sleep = 1000
        end
        Wait(sleep)
    end
end)