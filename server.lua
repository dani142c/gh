local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")





RegisterNetEvent("gh:onDuty")
AddEventHandler("gh:onDuty", function()
    local source = source
    local user_id = vRP.getUserId({source})
    vRP.getUserIdentity({user_id, function(identity)
        local name = identity.firstname.." "..identity.name
    local politi = vRP.getUsersByGroup({"Politi-Job"})
    if vRP.hasGroup({user_id,"Politi-Job"}) then
        for k, v in pairs(politi) do
            TriggerClientEvent('mythic_notify:client:SendAlert', vRP.getUserSource({v}), { type = 'inform', text = name .. ' Er på arbejde', length = 2500 }) 
        end
    else
        TriggerClientEvent("pNotify:SendNotification", source, {text = "Du er ikke betjent", type = "error", queue = "global", timeout = 2000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})   
    end
end})
end)







RegisterNetEvent("gh:offDuty")
AddEventHandler("gh:offDuty", function()
    local source = source
    local user_id = vRP.getUserId({source})
    vRP.getUserIdentity({user_id, function(identity)
        local name = identity.firstname.." "..identity.name
    local politi = vRP.getUsersByGroup({"Politi-Job"})
    if vRP.hasGroup({user_id,"Politi-Job"}) then
        for k, v in pairs(politi) do
            print(k)
            print(v)
            -- TriggerClientEvent("pNotify:SendNotification", vRP.getUserSource({v}), {text = name .. " Er på arbejde", type = "succes", queue = "global", timeout = 2000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
            TriggerClientEvent('mythic_notify:client:SendAlert', vRP.getUserSource({v}), { type = 'error', text = name .. ' Er gået af arbejde', length = 2500 }) 
        end
    else
        TriggerClientEvent("pNotify:SendNotification", source, {text = "Du er ikke betjent", type = "error", queue = "global", timeout = 2000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})   
    end
end})
end)

