--[[
    Serious Buff Timers!
        "How serious?" "Very serious!" "No, I meant 'Why serious?'" "Because Blizzy's %d m crap is... sarcastic?"
    
    Based on DoppelGanger_BuffTimers, by Kayde, which is in turn based on Edswor's TimerBuff
--]]

-- Hook Blizzy's function. What? You want to hook it too? TOUGH TITTIES!

function SecondsToTimeAbbrev(time)
    local m
    if( time <= 0 ) then
        return "";
    elseif time < 60 then
        return string.format("%d", time);
    elseif( time < 3600 ) then
        m = math.floor(time / 60)
        local s = math.fmod(time, 60)
        return string.format("%d:%02d", m, s);
    else
        local hr = math.floor(time / 3600)
        m = math.floor( math.fmod(time, 3600) / 60 )
        return string.format("%d.%02dhr", hr, m);
    end
end

hooksecurefunc("AuraButton_Update", function(self, index)
		local button = _G[self..index]
		if (button and not button.styled) then applySkin(button) end
end)
