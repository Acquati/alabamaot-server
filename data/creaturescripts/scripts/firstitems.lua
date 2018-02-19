local commonItems =
{
	2661, -- scarf
	2461, -- leather helmet
	2467, -- leather armor
	2512, -- wooden shield
	2649, -- leather legs
	2643, -- leather boots
	2050 -- torch
}

function onLogin(player)
	if player:getLastLoginSaved() == 0 then
		local bag = doPlayerAddItem(player, 10522, 1)

		if getPlayerVocation(player) == 1 then
			doPlayerAddItem(player, 2190, 1) -- wand of vortex
			doAddContainerItem(bag, 2420, 1) -- machete
		elseif getPlayerVocation(player) == 2 then
			doPlayerAddItem(player, 2182, 1) -- snakebite rod
			doAddContainerItem(bag, 2420, 1) -- machete
		elseif getPlayerVocation(player) == 3 then
			doPlayerAddItem(player, 2389, 10) -- spears
			doAddContainerItem(bag, 2420, 1) -- machete
		elseif getPlayerVocation(player) == 4 then
			doPlayerAddItem(player, 2386, 1) -- axe
			doAddContainerItem(bag, 2420, 1) -- machete
			doAddContainerItem(bag, 2449, 1) -- bone club
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
