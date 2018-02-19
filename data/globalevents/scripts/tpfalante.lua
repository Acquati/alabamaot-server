function onThink(cid, interval, lastExecution)

local config = {
  --[cor] = {pos},
    [140] = {x = 1024, y = 1028, z = 7},
    [123] = {x = 1024, y = 1028, z = 7},
    }  
    
    for cor, pos in pairs(config) do              
        doSendAnimatedText(pos, "Batata", cor) -- Configurar texto aqui
          doSendMagicEffect(pos, 11) 

            doSendAnimatedText(pos, "Cenoura", cor)
            doSendMagicEffect(pos, 13)
       end
return true
end