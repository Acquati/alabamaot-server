local commonItems =
{
	2461, -- leather helmet
	2654, -- cape
	10297, -- shield of care
	2649, -- leather legs
	2642, -- sandals
	2050 -- torch
}

function onLogin(player)
	if player:getLastLoginSaved() == 0 then
		local bag = doPlayerAddItem(player, 10522, 1)

		if getPlayerVocation(player) == 1 then
			doPlayerAddItem(player, 2190, 1) -- wand of vortex
			doAddContainerItem(bag, 2384, 1) -- rapier
		elseif getPlayerVocation(player) == 2 then
			doPlayerAddItem(player, 2182, 1) -- snakebite rod
			doAddContainerItem(bag, 2384, 1) -- rapier
		elseif getPlayerVocation(player) == 3 then
			doPlayerAddItem(player, 2389, 10) -- spears
			doAddContainerItem(bag, 2384, 1) -- rapier
		elseif getPlayerVocation(player) == 4 then
			doPlayerAddItem(player, 2380, 1) -- hand axe
			doAddContainerItem(bag, 2384, 1) -- rapier
			doAddContainerItem(bag, 2448, 1) -- studded club
		end

		for i = 1, table.maxn(commonItems) do
			doPlayerAddItem(player, commonItems[i], 1)
		end
		
		doAddContainerItem(bag, 2120, 1) -- rope
		doAddContainerItem(bag, 2554, 1) -- shovel
		doAddContainerItem(bag, 7618, 1) -- health potion
		doAddContainerItem(bag, 12416, 5) -- aubergine
	end
	return true
end
