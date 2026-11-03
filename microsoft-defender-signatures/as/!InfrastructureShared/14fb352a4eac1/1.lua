-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\14fb352a4eac1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
if (((((not this_sigattrlog[1] and this_sigattrlog[2]) or not this_sigattrlog[3]) and this_sigattrlog[4]) or not this_sigattrlog[5]) and this_sigattrlog[6]) or not this_sigattrlog[7] then
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
}) do
    local l_0_2 = nil
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC45: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC50: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R6 in 'UnsetPending'

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
    if type(ExtractPartsFromUri((string.lower)(l_0_1.utf8p1))) ~= "table" or type((ExtractPartsFromUri((string.lower)(l_0_1.utf8p1))).host) ~= "string" or (ExtractPartsFromUri((string.lower)(l_0_1.utf8p1))).scheme ~= "http" and (ExtractPartsFromUri((string.lower)(l_0_1.utf8p1))).scheme ~= "https" then
      return mp.CLEAN
    end
    local l_0_8 = nil
    if not (string.match)((string.gsub)((ExtractPartsFromUri((string.lower)(l_0_1.utf8p1))).host, "%.$", ""), "^[%w%.%-]+$") then
      return mp.CLEAN
    end
    local l_0_9 = nil
    local l_0_10 = (string.match)((string.gsub)((ExtractPartsFromUri((string.lower)(l_0_1.utf8p1))).host, "%.$", ""), "%.([a-z]+)$")
    if l_0_10 == nil or ({buzz = true, stream = true, courses = true, charity = true, hair = true, bet = true, homes = true, uno = true, garden = true, beauty = true, zip = true, skin = true, bar = true, fit = true, coupons = true, date = true, pics = true})[l_0_10] ~= true then
      return mp.CLEAN
    end
    if (mp.CheckUrl)(l_0_1.utf8p1) == 1 and l_0_1.utf8p1 == 1 then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end

