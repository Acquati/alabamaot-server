function onUse(player, item, fromPosition, target, toPosition, isHotkey)
   -----------------------------------------------------------------------------------
   -- Local Variables --
   -----------------------------------------------------------------------------------
   local questChest = item:getUniqueId()
   -----------------------------------------------------------------------------------
   -- Check if player has already opened box --
   -----------------------------------------------------------------------------------
   if player:getStorageValue(questChest) == 1 then
       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
       return true
   end
   -----------------------------------------------------------------------------------
   -- Check if player meets level requirment
   -----------------------------------------------------------------------------------
   local playerLevel = player:getLevel()
   local minLevel = questChests[questChest].minLevel
   if questChests[questChest].minLevel > playerLevel then
       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be level "..minLevel.." to open this chest.")
       return true
   end
   -----------------------------------------------------------------------------------
 
   -- Give rewward if player has not yet opened box --
 
   -----------------------------------------------------------------------------------
   for i = 1, #questChests[questChest].items do
       local rewardType = questChests[questChest].items[i].type
       -----------------------------------------------------------------------------------
       -- Item Type Reward --
       -----------------------------------------------------------------------------------
       if rewardType == "item" then
           local item = questChests[questChest].items[i].item
           local count = questChests[questChest].items[i].count
           player:addItem(item, count)
           player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You earned ["..count.."x] "..capAll(getItemName(item)))
       end
       -----------------------------------------------------------------------------------
       -- Experience Type Reward --
       -----------------------------------------------------------------------------------
       if rewardType == "experience" then
           local amount = questChests[questChest].items[i].amount
           player:addExperience(amount)
           player:say(amount.." EXP gained!", TALKTYPE_MONSTER_SAY)
           player:getPosition():sendMagicEffect(CONST_ME_STUN)
           player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained "..amount.." experience points.")
       end
       -----------------------------------------------------------------------------------
       -- Outfit Type Reward --
       -----------------------------------------------------------------------------------  
       if rewardType == "outfit" then
           local outfitName = questChests[questChest].items[i].name
           local maleOutfit = questChests[questChest].items[i].maleId
           local femaleOutfit = questChests[questChest].items[i].femaleId
           if player:getSex() == 0 then
               player:addOutfit(femaleOutfit)
           else
               player:addOutfit(maleOutfit)
           end
           player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained the "..outfitName.." outfit.")
       end
       -----------------------------------------------------------------------------------
       -- Addon Type Reward --
       -----------------------------------------------------------------------------------  
       if rewardType == "addon" then
           local outfitName = questChests[questChest].items[i].outfit
           local addon = questChests[questChest].items[i].addonNumber
           local maleAddon = questChests[questChest].items[i].maleId
           local femaleAddon = questChests[questChest].items[i].femaleId
           if player:getSex() == 0 then
               player:addOutfitAddon(femaleAddon, addon)
           else
               player:addOutfitAddon(maleAddon, addon)
           end
           if addon == 1 then
               player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained the first "..outfitName.." outfit addon.")
           elseif addon == 2 then
               player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained the second "..outfitName.." outfit addon.")
           elseif addon == 3 then
               player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained the third "..outfitName.." outfit addon.")
           end
       end
       -----------------------------------------------------------------------------------
       -- Mount Type Reward --
       -----------------------------------------------------------------------------------
       if rewardType == "mount" then
           local mountName = questChests[questChest].items[i].mountName
           local mountId = questChests[questChest].items[i].mountId
           player:addMount(mountId)
           player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You have unlocked the "..mountName.." mount.")
       end
   end
   -----------------------------------------------------------------------------------
   -- Add in any cooldowns/storages --
   -----------------------------------------------------------------------------------
   player:setStorageValue(questChest, 1)
   return true
end