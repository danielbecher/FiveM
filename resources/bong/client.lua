local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("bong")

RegisterCommand("bong",function(source, args)
    local player = PlayerPedId()
        Citizen.CreateThread(function() 
            while 'bong' do
                Citizen.Wait(0)
                if IsEntityPlayingAnim( player, "anim@safehouse@bong", "bong_stage1", 3) then
                    DisableControlAction(0,48,true) 
                    DisableControlAction(0,37,true) 
                    SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
                end
            end
        end) 

    local ad = "anim@safehouse@bong"
    local prop_name = prop_name or 'prop_bong_01'
    local secondaryprop_name = secondaryprop_name or 'p_cs_lighter_01'              
        if func.checkbong() then
            if ( DoesEntityExist( player ) and not IsEntityDead( player )) and not IsPauseMenuActive() and not IsPedSwimming(GetPlayerPed(-1)) and not IsPedSwimmingUnderWater(GetPlayerPed(-1)) and not IsPedShooting(GetPlayerPed(-1)) and not IsPedDiving(GetPlayerPed(-1)) and not IsPedFalling(GetPlayerPed(-1)) then 
                loadAnimDict( ad )            
                local x,y,z = table.unpack(GetEntityCoords(player))
                prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
                secondaryprop = CreateObject(GetHashKey(secondaryprop_name), x, y, z+0.2,  true,  true, true)
                AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 18905), 0.10, -0.25, 0.0, 95.0, 190.0, 180.0, true, true, false, true, 1, true)
                AttachEntityToEntity(secondaryprop, player, GetPedBoneIndex(player, 58866), 0.08, -0.05, -0.01, -50.0, 0.0, -50.0, true, true, false, true, 1, true)
                TaskPlayAnim( player, ad, "bong_stage1", 3.0, -8, -1, 63, 0, 0, 0, 0 )
                Wait(2000)
                TriggerEvent("vrp_sound:source", 'bong', 0.2)
                Wait(7000)
                DetachEntity(prop, 1, 1)
                DeleteObject(prop)
                DetachEntity(secondaryprop, 1, 1)
                DeleteObject(secondaryprop)
                Wait(1000)
                TriggerEvent("vrp_sound:distance", source, 0.8, 'love', 0.2)
                ClearPedSecondaryTask(PlayerPedId())
                StartScreenEffect("DMT_flight",50000,false)
                LoadAnimSet("MOVE_M@DRUNK@VERYDRUNK")   
                SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", 1.0)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.4)
                Wait(24000)
                TriggerEvent("vrp_sound:source", 'love2', 0.2)                
                Wait(25000)
                StopAllScreenEffects()
                ResetPedMovementClipset(GetPlayerPed(-1))
            end
        end    
end)

--------------------------------------------------------------------------------------------------------------
--FUNCOES
--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function(prop_name, secondaryprop_name)
    while true do
        Citizen.Wait(500)
        if IsPedRagdoll(PlayerPedId()) then 
            local playerPed = PlayerPedId()
            local prop_name = prop_name
            local secondaryprop_name = secondaryprop_name
            DetachEntity(prop, 1, 1)
            DeleteObject(prop)
            DetachEntity(secondaryprop, 1, 1)
            DeleteObject(secondaryprop)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlPressed(1, 56) then
        DetachEntity(prop, 1, 1)
        DeleteObject(prop)
        DetachEntity(secondaryprop, 1, 1)
        DeleteObject(secondaryprop)
        ClearPedTasks(GetPlayerPed(-1))
        ClearPedSecondaryTask(GetPlayerPed(-1))
        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), false)
        end
    end
 end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function LoadAnimSet(clipset)
    while (not HasAnimSetLoaded(clipset)) do
        RequestAnimSet(clipset)
        Citizen.Wait(5)
    end
end

