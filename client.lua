local QBCore = exports['qb-core']:GetCoreObject()
local vehiclename = "adder"
local vehcoords = vector3(-365.58, 6334.3, 29.85)
local accountMoney = xPlayer.PlayerData.money["bank"] -- This is a server function in QBCore i think (xPlayer isnt defined either)
local vehicle = CreateVehicle(vehiclename, vehcoords, plyCoords, true, false) -- You probably dont want this here 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local plyCoords = GetEntityCoords(PlayerPedId(), false)
        local coords = vector3(-346.36, 6337.4, 29.0)
        local dist = #(plyCoords - coords)
        if dist <= 25.0 then
            if not DoesEntityExist(dealer) then
                RequestModel("s_m_y_dealer_01")
                while not HasModelLoaded("s_m_y_dealer_01") do
                    Wait(10)
                end
                dealer = CreatePed(26, "s_m_y_dealer_01", coords, 0.00,false, false)
                SetEntityHeading(dealer, 1.8)
                SetBlockingOfNonTemporaryEvents(dealer, true)
                SetEntityInvincible(dealer, true)
                FreezeEntityPosition(dealer, true)
            end

            if dist <= 25.0 then
                QBCore.Functions.DrawText3D(-346.36, 6337.4, 30.0, "~g~[E]~b~ To Buy Stolen Car for £500")
            end

            if IsControlJustPressed(0, 38) then
                xPlayer.Functions.RemoveMoney('bank', 500, "Car") -- This is a server function in QBCore i think (xPlayer isnt defined either)
                RequestModel(vehiclename)
                while not HasModelLoaded(vehiclename) do
                    Wait(500)
                end -- you missed this end 
            end
        end -- you missed this end 
    end -- you missed this end 
end)