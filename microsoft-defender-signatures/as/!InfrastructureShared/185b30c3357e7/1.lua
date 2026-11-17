-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\185b30c3357e7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
if ((((((this_sigattrlog[1] or not this_sigattrlog[2]) and this_sigattrlog[3]) or not this_sigattrlog[4]) and this_sigattrlog[5]) or not this_sigattrlog[6]) and this_sigattrlog[7]) or not this_sigattrlog[8] then
  for l_0_5,l_0_6 in ipairs({
{}
, 
{}
, 
{}
, 
{}
, 
{}
, 
{}
, 
{}
, 
{}
}) do
    local l_0_2 = nil
    -- DECOMPILER ERROR at PC46: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC50: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC55: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC59: Confused about usage of register: R6 in 'UnsetPending'

    if ({}).matched == true and type(({}).utf8p1) == "string" and type(({}).utf8p2) == "string" then
      l_0_1 = {}
      break
    end
  end
  do
    if l_0_1 == nil then
      return mp.CLEAN
    end
    local l_0_7 = nil
    local l_0_8 = (string.lower)(l_0_1.utf8p1)
    if contains(l_0_8, "clickfix-awareness.vercel.app") or contains((string.lower)(l_0_1.utf8p2), "clickfix-awareness.vercel.app") then
      return mp.INFECTED
    end
    local l_0_9 = nil
    if type(ExtractPartsFromUri(l_0_8)) ~= "table" or type((ExtractPartsFromUri(l_0_8)).host) ~= "string" or (ExtractPartsFromUri(l_0_8)).scheme ~= "http" and (ExtractPartsFromUri(l_0_8)).scheme ~= "https" then
      return mp.CLEAN
    end
    local l_0_10 = nil
    if not (string.match)((string.gsub)((ExtractPartsFromUri(l_0_8)).host, "%.$", ""), "^[%w%.%-]+$") then
      return mp.CLEAN
    end
    local l_0_11 = nil
    local l_0_12 = (string.match)((string.gsub)((ExtractPartsFromUri(l_0_8)).host, "%.$", ""), "%.([a-z]+)$")
    if l_0_12 == nil or ({buzz = true, stream = true, courses = true, charity = true, hair = true, bet = true, homes = true, uno = true, garden = true, beauty = true, zip = true, skin = true, bar = true, fit = true, coupons = true, date = true, pics = true})[l_0_12] ~= true then
      return mp.CLEAN
    end
    if (mp.CheckUrl)(l_0_1.utf8p1) == 1 and l_0_1.utf8p1 == 1 then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end

