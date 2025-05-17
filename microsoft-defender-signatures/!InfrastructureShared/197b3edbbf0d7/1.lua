-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\197b3edbbf0d7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (this_sigattrlog[9]).utf8p2
local l_0_1 = (string.find)(l_0_0, "Bytes:", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0:sub(l_0_1)
local l_0_3 = tonumber(l_0_2:match("Bytes:(%d+)"))
local l_0_4 = (string.find)(l_0_0, "Count:", 1, true)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = tonumber(l_0_2:match("Count:(%d+)"))
if l_0_3 and l_0_3 > 7500000 and l_0_3 < 12000000 and l_0_5 > 200 and l_0_5 < 360 then
  (bm.add_related_string)("ReadVM", "Bytes: " .. l_0_3 .. " Count: " .. l_0_5, bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN

