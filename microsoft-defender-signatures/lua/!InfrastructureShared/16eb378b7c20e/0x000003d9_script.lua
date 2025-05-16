-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\16eb378b7c20e\0x000003d9_luac 

-- params : ...
-- function num : 0
if isnull((this_sigattrlog[9]).utf8p2) then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) or (string.find)((string.lower)(l_0_0), "\\program files", 1, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (string.match)((this_sigattrlog[9]).utf8p2, "bytes:(%d+).-count:(%d+)")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
l_0_1 = tonumber(l_0_1)
if l_0_1 > 52000000 and l_0_1 < 75000000 and l_0_2 > 5500 and l_0_2 < 9000 then
  (bm.add_related_string)("ReadVM", (string.format)("Bytes: %d Count: %d", l_0_1, l_0_2), bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN

