local table = {
  ["Widow Queen"] = {price = 160000, id = 1},
  ["Racing Bird"] = {price = 50000, id = 2},
  ["War Bear"] = {price = 35000, id = 3},
  ["Black Sheep"] = {price = 800000, id = 4},
  ["Midnight Panther"] = {price = 500000, id = 5},
  ["Draptor"] = {price = 160000, id = 6},
  ["Titanica"] = {price = 880000, id = 7},
  ["Tin Lizzard"] = {price = 1500000, id = 8},
  ["Rapid Boar"] = {price = 1900000, id = 10},
  ["Stampor"] = {price = 770000, id = 11},
  ["Undead Cavebear"] = {price = 550000, id = 12},
  ["Donkey"] = {price = 7000, id = 13},
  ["Tiger Slug"] = {price = 600000, id = 14},
  ["Uniwheel"] = {price = 1600000, id = 15},
  ["Crystal Wolf"] = {price = 35000, id = 16},
  ["War Horse"] = {price = 1000, id = 17},
  ["Kingly Deer"] = {price = 39000, id = 18},
  ["Tamed Panda"] = {price = 17000, id = 19},
  ["Dromedary"] = {price = 620000, id = 20},
  ["Scorpion King"] = {price = 2700000, id = 21},
  ["Rented Horse 1"] = {price = 1000, id = 22},
  ["Rented Horse 2"] = {price = 1000, id = 25},
  ["Rented Horse 3"] = {price = 1000, id = 26},
  ["Lady Bug"] = {price = 3000000, id = 27},
  ["Manta Ray"] = {price = 5600000, id = 28},
  ["Ironblight"] = {price = 36000, id = 29},
  ["Magma Crawler"] = {price = 38000, id = 30},
  ["Dragonling"] = {price = 3000000, id = 31},
  ["Gnarlhound"] = {price = 300000, id = 32},
  ["Water Buffalo"] = {price = 28000, id = 35},
  ["Ursagrodon"] = {price = 250000, id = 38},
  ["Noble Lion"] = {price = 70000, id = 40},
  ["Shock Head"] = {price = 8000000, id = 42},
  ["Walker"] = {price = 1000, id = 43}
}
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                  npcHandler:onThink()                    end
 
function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
 
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
     if table[msg] then
      local t = table[msg]
      talkState[talkUser] = 1
       if getPlayerPremiumDays(cid) >= 1 then
        if not getPlayerMount(cid, t.id) then
         if doPlayerRemoveMoney(cid, t.price) then
          doPlayerAddMount(cid, t.id)
          selfSay("You lost "..t.price.." gp! for mount!", cid)
          talkState[talkUser] = 0
         else
          selfSay("Sorry, you do not have enough money!", cid)
          talkState[talkUser] = 0
         end
        else
         selfSay("You already have this mount!", cid)
         talkState[talkUser] = 0
        end
       else
        selfSay("You must be Premium!", cid)
        talkState[talkUser] = 0
       end
    else
    selfSay('What? Please told me a correct name of mount!', cid)
    talkState[talkUser] = 0
   end
   return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())