--[[
    Serious Buff Timers!
        "How serious?" "Very serious!" "No, I meant 'Why serious?'" "Because Blizzy's %d m crap is... sarcastic?"
    
    Based on DoppelGanger_BuffTimers, by Kayde, which is in turn based on Edswor's TimerBuff
--]]

-- Hook Blizzy's function. What? You want to hook it too? TOUGH TITTIES!

local function SecondsToTimeAbbrev(button, time)
    local duration = _G[button:GetName().."Duration"]
    local m, text
    if( time <= 0 ) then
        text = "";
    elseif time < 60 then
        text = duration:SetFormattedText("%d", time);
    elseif( time < 3600 ) then
        m = math.floor(time / 60)
        local s = math.fmod(time, 60)
        text = duration:SetFormattedText("%d:%02d", m, s);
    else
        local hr = math.floor(time / 3600)
        m = math.floor( math.fmod(time, 3600) / 60 )
        text = duration:SetFormattedText("%d.%02dhr", hr, m);
    end
    return text
end
hooksecurefunc("AuraButton_UpdateDuration", SecondsToTimeAbbrev) 
