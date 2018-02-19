local config = {
    positions = {
        ["Hunts"] = {x = 1024, y = 1028, z = 7},
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(211,212))
    end
    
    return true
end  