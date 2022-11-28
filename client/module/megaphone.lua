Citizen.CreateThread(function()
    megaphoneEffectId = CreateAudioSubmix('Megaphone')
    SetAudioSubmixOutputVolumes(
            megaphoneEffectId,
            1,
            0.30,
            0.50,
            0.0,
            0.0,
            1.0,
            1.0
    )
    AddAudioSubmixOutput(megaphoneEffectId, 1)
end)

-- Megaphone Stuff
Citizen.CreateThread(function()
    table.insert(Cfg.voiceModes, {20.0, "Megaphone"})
end)

exports("setMegaphone", function(bool, value)
    if bool then
        mode = #Cfg.voiceModes
        setProximityState(Cfg.voiceModes[#Cfg.voiceModes][1], true)
        MumbleSetSubmixForServerId(PlayerId(), megaphoneEffectId)
        TriggerEvent('pma-voice:setTalkingMode', #Cfg.voiceModes)
        TriggerEvent('plrp-hud:setVoiceRange', mode)
    else
        mode = value
        setProximityState(Cfg.voiceModes[value][1], false)
        MumbleSetSubmixForServerId(PlayerId(), -1)
        TriggerEvent('pma-voice:setTalkingMode', value)
        TriggerEvent('plrp-hud:setVoiceRange', mode)
    end
end)

--end Megaphone Stuff