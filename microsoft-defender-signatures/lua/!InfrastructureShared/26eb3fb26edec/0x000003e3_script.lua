-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\26eb3fb26edec\0x000003e3_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0 and (string.find)(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
local l_0_1 = (this_sigattrlog[14]).utf8p2
local l_0_2 = (string.find)(l_0_1, "Bytes:", 1, true)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = l_0_1:sub(l_0_2)
local l_0_4 = tonumber(l_0_3:match("Bytes:(%d+)"))
local l_0_5 = (string.find)(l_0_1, "Count:", 1, true)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = tonumber(l_0_3:match("Count:(%d+)"))
if l_0_4 and l_0_4 > 52000000 and l_0_4 < 75000000 and l_0_6 > 5500 and l_0_6 < 7000 then
  (bm.add_related_string)("ReadVM", "Bytes: " .. l_0_4 .. " Count: " .. l_0_6, bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN

