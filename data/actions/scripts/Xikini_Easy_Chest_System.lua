function onUse(cid, item, fromPosition, itemEx, toPosition)
 
    --[[
   
...............................................................................
........__.....__.._______...__....__.._______...___.....__..._______..........
........\.\..././.|__...__|.|..|.././.|__...__|.|...\...|..|.|__...__|.........
.........\.\././.....|.|....|..|././.....|.|....|....\..|..|....|.|............
..........\.../......|.|....|..|/./......|.|....|..|\.\.|..|....|.|............
........../...\......|.|....|.....\......|.|....|..|.\.\|..|....|.|............
........././.\.\...__|.|__..|..|\..\...__|.|__..|..|..\....|..__|.|__..........
......../_/...\_\.|_______|.|__| \__\.|_______|.|__|...\___|.|_______|.........
...............................................................................
 
https://otland.net/threads/241126/#post-2331922
]]
 
 
    --[[
 
        Yes, This green text is long.
        Yes, it's needed.
       
       
        General usage
            -> Place item/chest on map.
            -> Give item/chest on map an Action_ID
            -> Update reward in this script.
            -> Ensure actions.xml contains the Action_ID's required in this script.
            -> Recommend using ' actionid="45801-45899" ' in actions.xml, to save space and time.
       
        For most 'options' | 1 = true | 0 = false/ignore |
        However, it is recommended to remove unused portions of tables where possible.
        Unexpected results can be expected if you keep 'unused options' within the tables.
       
        Options that can be turned off using 0
            -> random_item
            -> timed
            -> use_container
       
-----------------------------------------
        -> This note applies to special requirements
                -> uid
                -> writable
                -> flavourText
               
        -> Note: If you attempt to place a special requirement on more then 1 item at a time, the special requirement will only be placed on the first item.
                Example: [1] = { aid = 45811, uid = 1, item_id = 2467, item_count = 3 }
                -> In this example, 3 leather armors will be added to the player inventory.
                    Only the first leather armor added will contain the uid.
------------------------------------------
 
        aid
            -> This is the chest/item value used in the map.
            -> It is also the storage value for the chest/item.
            -> Note: AID is used for keys as well.
                If you want to add a key, always make sure the next chest/item's aid is ahead of your key values
               
        multi_chest
            -> If you want to have more then 1 chest in a quest.
            -> Think Anni-Style quests.
            -> If using 'multi_chest' then make the aid of each chest the same, and make the uid of each chest different
       
        uid
            -> If you want to add an uid to an item use 'uid = 1'. This will default to the aid used for the chest/item.
            -> If you are adding more then 1 item with an uid, or you want to use custom uid's, simply put in the uid you want to use.
                    example: uid = 45001
            -> Note: If you place an uid on stackable items, unexpected results are expected.
            -> Note: It's impossible to add an uid to 'use_container'
                This is only the holding containers. Any item you place 'inside' can have a uid attributed to it.
               
        key
            -> If you use 'key = 1', key's AID will default to the 'aid + 1' used for the chest/item.
            -> It's exactly the same as uid.. but for keys.
            -> If you want to add a key, always make sure the next chest/item's aid is ahead of your key values
                -> AGAIN, Never put the key's value the same as a chest.
                    This will allow the key to be 'used' to obtain rewards from the chest(s), because they have the same aid.
       
        item_id
            -> Fairly simple. Just put the itemID of the item you wish to give.
           
        item_count
            -> Again, fairly simple. Put the amount of items you want to give.
            -> If there is no 'item_count' then it will default to 1.
                -> Note: If the item is not stackable, and you give more then 1 item, unexpected results are expected.
                -> Note: If item is stackable and you put more then 100, unexpected results are expected.
                -> Note: If you put 0 as the item_count, unexpected results are expected.
                -> Note: If sub_id is present, item_count will be ignored.
            -> Can use math.random(number) to specify a random amount.
           
        sub_id
            -> Rarely used, but useful if needed.
            -> Note: The commands to give 'sub_id' use [count/subType]
                Explanation/Reason
                    All items that have subTypes are not stackable, so it simply doesn't care if the item has a count.
                    For this reason, if subType is used, item_count will be ignored.
                   
        vocation_required
            -> Look on line 111 if you want to edit the vocation_required section.
            -> Allows you to set a certain vocation for each chest.
                sorcerer = sorcerer or master sorcerer
                master sorcerer = only master sorcerer
                et cetera,..
           
        writeable
            -> Allows you to place text inside of writable/readable objects.
            -> Note: If you use on an item that is not writable/readable, unexpected results are expected.
           
        flavourText
            -> Allows you to place 'flavourText'
            -> flavourTest appears at the very end of an item.
                Example:
                    14:11 You see a blade of corruption (Atk:91, Def:101).
                    It weighs 80.00 oz.
                    This is where flavourText appears.
               
        random_item
            -> Allows you to give 1 random item + amount.
            -> Note: Must be used in conjuction with 'items' table.
           
        items
            -> Is a table value used in conjuction with 'random_item'
            -> Create table as long as you want counting with [1], [2], [3], et cetera.
               
        timed
            -> This tells the script that this chest/item is reusable after a x amount time.
           
        timer
            -> Tells the script how long until the chest/item can be reused.
            -> Timer is only used if 'timed = 1'
            -> Time is counted in seconds.
                Examples:
                    60 = 60 seconds
                    120 = 2 minutes
                    2*60 = 2 minutes
                    4*60*60 = 4 hours
            -> If no timer exists, timer is defaulted to 24 hours.
            -> Note: If you put 0 as the timer, unexpected results are expected.
       
        use_container
            -> This tells the script to put items into a container.
                -> Note: If using 'random_items', 'use_container' will be ignored.
            -> You are only allowed to go 2 containers deep.
                Example: brown bag, containing a brown backpack, containing a leather helmet.
            -> Note: Must be used in conjuction with 'inside' table(s).
 
        container
            -> Tells the script what container to use.
                -> If no container is specified will default to a brown bag.
            -> Note: If more items are given then the capacity of the container(s), unexpected results are expected.
            -> Note: If you put 0 as the container, unexpected results are expected.
           
        inside
            -> Is a table value used in conjuction with 'use_container'
            -> Create table as long as you want counting with [1], [2], [3], et cetera.
                -> Note: If you make the table longer then the capacity of 'container', unexpected results are expected.
               
        ]]
 
 
   
    exstorage = 45800
    t = {
        -- Simple chest
        -- 1 Brown Backpack
        [1] = { aid = 45801, item_id = 1988 },
       
        -- Simple key chest
        -- 1 wooden key with AID 45803
        [2] = { aid = 45802, key = 1, item_id = 2087 },
       
-- SKIP 1 AID
       
        -- Simple key chest
        -- 1 silver key with AID 45806
        [3] = { aid = 45804, key = 45806, item_id = 2088 },
       
-- SKIP 2 AID
       
        -- Simple chest with stackable items
        -- 3 Gold Coins
        [4] = { aid = 45807, item_id = 2148, item_count = 3 },
       
        -- Simple chest with random amount of stackable items
        -- 1-5 red apples
        [5] = { aid = 45808, item_id = 2674, item_count = math.random(5) },
       
        -- Multiple items chest
        -- 1 brown bag, 1 Leather Boots, 1 Leather Legs, 3 platinum coins
        [6] = { aid = 45809, use_container = 1, inside = {
                [1] = { item_id = 2643 },
                [2] = { item_id = 2649 },
                [3] = { item_id = 2152, item_count = 3 }
                }
            },
       
        -- Multiple of the same item chest
        -- 1 brown bag, 2 vials of oil, 1 lamp, 5 torches
        [7] = { aid = 45810, use_container = 1, inside = {
                [1] = { item_id = 2006, sub_id = 11 },
                [2] = { item_id = 2006, sub_id = 11 },
                [3] = { item_id = 2044 },
                [4] = { item_id = 2050, item_count = 5 }
                }
            },
           
        -- Multiple key with aid chest
        -- 1 brown backpack, 1 wooden key, 1 silver key, 1 golden key, with AID's 45812, 45813, 45814
        [8] = { aid = 45811, use_container = 1, container = 1988, inside = {
                [1] = { item_id = 2091, key = 1 },
                [2] = { item_id = 2088, key = 45813 },
                [3] = { item_id = 2087, key = 45814 }
                }
            },
           
-- SKIP 3 AID
           
        -- Multiple items chest with items contained inside containers, and without
        -- 1 brown bags, 1 brown backpack, 1 leather helmet, 1 leather armor, 1 crystal ring
        -- 1 sword, 1 wooden shield, 1 scarf, 1 red bag, 25 arrows, 1-4 cherries
        [9] = { aid = 45815, use_container = 1, inside = {
                [1] = { use_container = 1, container = 1993, inside = {
                    [1] = { item_id = 2512 },
                    [2] = { item_id = 2376 },
                    [3] = { item_id = 2456 }
                    }
                },
                [2] = { use_container = 1, inside = {
                    [1] = { item_id = 2461 },
                    [2] = { item_id = 2467 },
                    [3] = { item_id = 2544, item_count = 25 }
                    }
                },
                [3] = { item_id = 2124 },
                [4] = { item_id = 2679, item_count = math.random(4) },
                [5] = { item_id = 2661 }
                }
            },
       
        --  Multiple items chest, showing how to use 'writable' and 'flavourText'
        -- 1 brown bag,
        -- 2 stamped letters (1 with an uid)(both with 'writable'),
        -- 2 bone keys (1 with an aid)(both with 'flavourText'),
        -- 1 letter, containing uid, writable, and flavourText
        [10] = { aid = 45816, use_container = 1, inside = {
                [1] = { item_id = 2598, writeable = "Writeable goes here." },
                [2] = { item_id = 2598, uid = 1, writeable = "I have the uid." },
                [3] = { item_id = 2092, flavourText = "flavourText goes here." },
                [4] = { item_id = 2092, key = 1, flavourText = "I have the uid." },
                [5] = { item_id = 2597, uid = 45817, writeable = "Use /n with a left-to-right slash,\nTo make new lines.\n\nYou can add many in a row if required.", flavourText = "I am a proud unstamped letter." }
                }
            },
           
-- SKIP 1 AID
       
        -- Simple key chest (24h timer)
        -- 1 wooden key with AID 45801
        [11] = { aid = 45818, timed = 1, key = 1, item_id = 2087 },
       
-- SKIP 1 AID
           
        -- Random item Chest. (better known on the forum as 'Daily Chest'.
        -- 1 stamped letter with uid + writable
        -- 1 crystal key with uid + flavourText
        -- 1 brown book with uid, + writable + flavourText
        [12] = { aid = 45820, timed = 1, random_item = 1, items = {
                [1] = { item_id = 2598, uid = 1, writeable = "Woo text. :D...." },
                [2] = { item_id = 2090, key = 1, flavourText = "I ain't a key, I am Le key.." },
                [3] = { item_id = 1950, uid = 45821, writeable = "Woo more text. \n:D......", flavourText = "I am a Book.\n\nA strong and sturdy book." }
                }
            },
           
-- SKIP 1 AID
           
        -- Random item Chest. (with 15 second delay.)
        -- Who wants to build a cake with meh?
        [13] = { aid = 45822, timed = 1, timer = 15, random_item = 1, items = {
                [1] = { item_id = 2006, sub_id = 6 },
                [2] = { item_id = 2692, item_count = 2 },
                [3] = { item_id = 2680, item_count = math.random(3) },
                [4] = { item_id = 2566 },
                [5] = { item_id = 2047 }
                }
            },
       
        -- Anni-Style Chest
        -- Actual annihilator loot. You get one of the following,
        -- Magic Sword, Demon Armor, Stonecutter Axe, or a present box containing an annihilation bear
        [14] = { aid = 45823, multi_chest = 45823, item_id = 2400 },
        [15] = { aid = 45823, multi_chest = 45824, item_id = 2494 },
        [16] = { aid = 45823, multi_chest = 45825, item_id = 2431 },
        [17] = { aid = 45823, multi_chest = 45826, item_id = 1988, use_container = 1, container = 1990, inside = {
                [1] = { item_id = 2326 }
                }
            },
       
-- SKIP 3 AID
 
        -- Simple vocational chest
        -- vocational item, sword, crossbow, spellbook, red apple
        [18] = { aid = 45827, multi_chest = 45827, vocation_required = "sorcerer", item_id = 2175 },
        [19] = { aid = 45827, multi_chest = 45828, vocation_required = "druid", item_id = 2674 },
        [20] = { aid = 45827, multi_chest = 45829, vocation_required = "paladin", item_id = 2455 },
        [21] = { aid = 45827, multi_chest = 45830, vocation_required = "knight", item_id = 2376 },
       
-- SKIP 3 AID
 
        -- Slightly more complicated vocational chest
        -- vocational items, broadsword,  royal crossbow, spellbook, red apple
        [22] = { aid = 45831, multi_chest = 45831, vocation_required = "master sorcerer", item_id = 8900 },
        [23] = { aid = 45831, multi_chest = 45832, vocation_required = "elder druid", item_id = 6393 },
        [24] = { aid = 45831, multi_chest = 45833, vocation_required = "royal paladin", item_id = 8851 },
        [25] = { aid = 45831, multi_chest = 45834, vocation_required = "elite knight", item_id = 2413 },
       
-- SKIP 3 AID
 
        -- Simple chest
        -- 1 Brown Backpack
        [26] = { aid = 45835, item_id = 1988 } -- Always make sure the very last line in the table has no comma.
       
--------------------------------------------------
-- That's everything you can do with the system.--
--------------------------------------------------
       
    }
 
    ---------------------------------------------------------------------
    -- don't touch anything under here unless you know what your doing --
    ---------------------------------------------------------------------
    n = 0
    m = 0
    no_inv = 0
 
    if exhaustion.check(cid, exstorage) then
        doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
        return true
    end
    exhaustion.set(cid, exstorage, 1)
   
    for i = 1, #t do
        if t[i].aid == item.aid then
            if t[i].timed ~= nil then
                if exhaustion.check(cid, t[i].aid) then
                    doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
                    doPlayerSendCancel(cid, "You are exhausted. You can obtain this reward again in ".. os.date("!%Hh %Mm %Ss", getPlayerStorageValue(cid, t[i].aid) - os.time()) ..".")
                    break
                end
                setPlayerStorageValue(cid, t[i].aid, 0)
            end
            if getPlayerStorageValue(cid, t[i].aid) >= 1 then
                doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
                doPlayerSendCancel(cid, "It is empty.")
                return true
            end
            if t[i].multi_chest ~= nil then
                i = i
                repeat
                    if t[i].multi_chest ~= item.uid then
                        i = i + 1
                    end
                until t[i].multi_chest == item.uid
            end
            if t[i].vocation_required ~= nil then
                local voc = true
                if t[i].vocation_required == "sorcerer" then
                    if getPlayerVocation(cid) ~= 1 or not 5 then
                        voc = false
                    end
                elseif t[i].vocation_required == "master sorcerer" then
                    if getPlayerVocation(cid) ~= 5 then
                        voc = false
                    end
                elseif t[i].vocation_required == "druid" then
                    if getPlayerVocation(cid) ~= 2 or not 6 then
                        voc = false
                    end
                elseif t[i].vocation_required == "elder druid" then
                    if getPlayerVocation(cid) ~= 6 then
                        voc = false
                    end
                elseif t[i].vocation_required == "paladin" then
                    if getPlayerVocation(cid) ~= 3 or not 7 then
                        voc = false
                    end
                elseif t[i].vocation_required == "royal paladin" then
                    if getPlayerVocation(cid) ~= 7 then
                        voc = false
                    end
                elseif t[i].vocation_required == "knight" then
                    if getPlayerVocation(cid) ~= 4 or not 8 then
                        voc = false
                    end
                elseif t[i].vocation_required == "elite knight" then
                    if getPlayerVocation(cid) ~= 8 then
                        voc = false
                    end
                end
                if voc == false then
                    doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
                    doPlayerSendCancel(cid, "Only ".. t[i].vocation_required .."'s can obtain this reward.")
                    return true
                end
            end
            n = i
            if t[i].random_item ~= nil then
                if t[i].random_item == 1 then
                    rand = math.random(#t[i].items)
                end
            end
            if getAllItemWeight(weight) > getPlayerFreeCap(cid) then
                doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
                doPlayerSendCancel(cid, "You require ".. string.format("%.2f", getAllItemWeight(weight)) .." capacity to obtain this reward.")
                return true
            end
            if t[i].random_item == 1 then
                if t[i].items[rand].sub_id ~= nil then
                    item = doCreateItemEx(t[i].items[rand].item_id, t[i].items[rand].sub_id or 1)
                else
                    item = doCreateItemEx(t[i].items[rand].item_id, t[i].items[rand].item_count or 1)
                end
                if(doPlayerAddItemEx(cid, item, false) ~= RETURNVALUE_NOERROR) then
                    no_inv = 1
                else
                    if t[i].items[rand].key ~= nil then
                        if t[i].items[rand].key > 1 then
                            doSetItemActionId(item, t[i].items[rand].key)
                        else
                            doSetItemActionId(item, t[i].aid + 1)
                        end
                    elseif t[i].items[rand].uid ~= nil then
                        if t[i].items[rand].uid > 1 then
                            doItemSetAttribute(item, "uid", t[i].items[rand].uid)
                        else
                            doItemSetAttribute(item, "uid", t[i].aid)
                        end
                    end
                    if t[i].items[rand].flavourText ~= nil then
                        doItemSetAttribute(item, "description", t[i].items[rand].flavourText)
                    end
                    if t[i].items[rand].writeable ~= nil then
                        doSetItemText(item, t[i].items[rand].writeable)
                    end
                end
            elseif t[i].use_container == 1 then
                local item = doCreateItemEx(t[i].container or 1987, 1)
                if(doPlayerAddItemEx(cid, item, false) ~= RETURNVALUE_NOERROR) then
                    no_inv = 1
                else
                    for i = 1, #t[n].inside do
                        if t[n].inside[i].use_container == 1 then
                            m = i
                            local newContainer = doAddContainerItem(item, t[n].inside[i].container or 1987, 1)
                            for i = 1, #t[n].inside[m].inside do
                                if t[n].inside[m].inside[i].sub_id ~= nil then
                                    item2 = doAddContainerItem(newContainer, t[n].inside[m].inside[i].item_id, t[n].inside[m].inside[i].sub_id or 1)
                                else
                                    item2 = doAddContainerItem(newContainer, t[n].inside[m].inside[i].item_id, t[n].inside[m].inside[i].item_count or 1)
                                end
                                if t[n].inside[m].inside[i].key ~= nil then
                                    if t[n].inside[m].inside[i].key > 1 then
                                        doSetItemActionId(item2, t[n].inside[m].inside[i].key)
                                    else
                                        doSetItemActionId(item2, t[n].aid + 1)
                                    end
                                elseif t[n].inside[m].inside[i].uid ~= nil then
                                    if t[n].inside[m].inside[i].uid > 1 then
                                        doItemSetAttribute(item2, "uid", t[n].inside[m].inside[i].uid)
                                    else
                                        doItemSetAttribute(item2, "uid", t[n].aid)
                                    end
                                end
                                if t[n].inside[m].inside[i].flavourText ~= nil then
                                    doItemSetAttribute(item2, "description", t[n].inside[m].inside[i].flavourText)
                                end
                                if t[n].inside[m].inside[i].writeable ~= nil then
                                    doSetItemText(item2, t[n].inside[m].inside[i].writeable)
                                end
                            end
                        else
                            if t[n].inside[i].sub_id ~= nil then
                                item2 = doAddContainerItem(item, t[n].inside[i].item_id, t[n].inside[i].sub_id or 1)
                            else
                                item2 = doAddContainerItem(item, t[n].inside[i].item_id, t[n].inside[i].item_count or 1)
                            end
                            if t[n].inside[i].key ~= nil then
                                if t[n].inside[i].key > 1 then
                                    doSetItemActionId(item2, t[n].inside[i].key)
                                else
                                    doSetItemActionId(item2, t[n].aid + 1)
                                end
                            elseif t[n].inside[i].uid ~= nil then
                                if t[n].inside[i].uid > 1 then
                                    doItemSetAttribute(item2, "uid", t[n].inside[i].uid)
                                else
                                    doItemSetAttribute(item2, "uid", t[n].aid)
                                end
                            end
                            if t[n].inside[i].flavourText ~= nil then
                                doItemSetAttribute(item2, "description", t[n].inside[i].flavourText)
                            end
                            if t[n].inside[i].writeable ~= nil then
                                doSetItemText(item2, t[n].inside[i].writeable)
                            end
                        end
                    end
                end
            else
                if t[i].sub_id ~= nil then
                    item = doCreateItemEx(t[i].item_id, t[i].sub_id or 1)
                else
                    item = doCreateItemEx(t[i].item_id, t[i].item_count or 1)
                end
                if(doPlayerAddItemEx(cid, item, false) ~= RETURNVALUE_NOERROR) then
                    no_inv = 1
                else
                    if t[i].key ~= nil then
                        if t[i].key > 1 then
                            doSetItemActionId(item, t[i].key)
                        else
                            doSetItemActionId(item, t[i].aid + 1)
                        end
                    elseif t[i].uid ~= nil then
                        if t[i].uid > 1 then
                            doItemSetAttribute(item, "uid", t[i].uid)
                        else
                            doItemSetAttribute(item, "uid", t[i].aid)
                        end
                    end
                    if t[i].flavourText ~= nil then
                        doItemSetAttribute(item, "description", t[i].flavourText)
                    end
                    if t[i].writeable ~= nil then
                        doSetItemText(item, t[i].writeable)
                    end
                end
            end
            if no_inv == 1 then
                doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
                doPlayerSendCancel(cid, "You require free inventory space to obtain this reward.")
                return true
            end
            if t[i].use_container == 1 then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a ".. getItemNameById(t[i].container or 1987) .." weighing ".. string.format("%.2f", getAllItemWeight(weight)) .." oz.")
            elseif t[i].random_item == 1 then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found ".. t[i].items[rand].item_count .." ".. getItemNameById(t[i].items[rand].item_id) ..".")
            else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found ".. t[i].item_count .." ".. getItemNameById(t[i].item_id) ..".")
            end
            if t[i].timed ~= nil then
                if t[i].timed == 1 then
                    exhaustion.set(cid, t[i].aid, t[i].timer or 24 * 60 * 60)
                else
                    setPlayerStorageValue(cid, t[i].aid, 1)
                end
            else
                setPlayerStorageValue(cid, t[i].aid, 1)
            end
            break
        end
    end
    return true
end
 
function getAllItemWeight(weight)
    local items = {}
    local count = {}
    local weight = 0
    if t[n].random_item == 1 then
        table.insert(items, t[n].items[rand].item_id)
        if t[n].items[rand].sub_id ~= nil then
            table.insert(count, 1)
        else
            table.insert(count, t[n].items[rand].item_count or 1)
        end
    elseif t[n].use_container == 1 then
        table.insert(items, t[n].container or 1987)
        table.insert(count, 1)
        for i = 1, #t[n].inside do
            if t[n].inside[i].use_container == 1 then
                table.insert(items, t[n].inside[i].container or 1987)
                table.insert(count, 1)
                m = i
                for i = 1, #t[n].inside[m].inside do
                    table.insert(items, t[n].inside[m].inside[i].item_id)
                    if t[n].inside[m].inside[i].sub_id ~= nil then
                        table.insert(count, 1)
                    else
                        table.insert(count, t[n].inside[m].inside[i].item_count or 1)
                    end
                end
            else
                table.insert(items, t[n].inside[i].item_id)
                if t[n].inside[i].sub_id ~= nil then
                    table.insert(count, 1)
                else
                    table.insert(count, t[n].inside[i].item_count or 1)
                end
            end
        end
    else
        table.insert(items, t[n].item_id)
        if t[n].sub_id ~= nil then
            table.insert(count, 1)
        else
            table.insert(count, t[n].item_count or 1)
        end
    end
    for i = 1, #items do
        weight = (weight + (getItemWeightById(items[i], count[i])))
    end
    return weight
end