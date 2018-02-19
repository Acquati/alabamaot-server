function onThink(interval, lastExecution)
	pos = {x = 1024, y = 1028, z = 7} -- Coordenadas do teleport
	doSendAnimatedText(pos, 'Hunts', 140) -- Ira mandar Texto animado na pos
	return true
end