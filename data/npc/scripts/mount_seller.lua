local table = {
    ["Widow Queen"] = {price = 10000, id = 1},
    ["Racing Bird"] = {price = 10000, id = 2},
    ["War Bear"] = {price = 10000, id = 3},
    ["Black Sheep"] = {price = 10000, id = 4},
    ["Midnight Panther"] = {price = 10000, id = 5},
    ["Draptor"] = {price = 10000, id = 6},
    ["Titanica"] = {price = 10000, id = 7},
    ["Tin Lizzard"] = {price = 10000, id = 8},
    ["Blazebringer"] = {price = 10000, id = 9},
    ["Rapid Boar"] = {price = 10000, id = 10},
    ["Stampor"] = {price = 10000, id = 11},
    ["Undead Cavebear"] = {price = 10000, id = 12}
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