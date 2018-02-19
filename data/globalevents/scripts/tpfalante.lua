function onThink(cid, interval, lastExecution)
	local pos = {x = 1024, y = 1028, z = 7} -- Coordenadas do teleport
	pos:sendTextMessage('Hunts') -- Ira mandar Texto animado na pos
	return true
end