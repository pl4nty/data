-- Threat: !InfrastructureShared
-- Name: 16eb378b7c20e
-- Type: 21
-- Includes: BMLuaLib

if isnull(this_sigattrlog[9].utf8p2) then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) or string.find(string.lower(l_0_0), "\\program files", 1, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.match(this_sigattrlog[9].utf8p2, "bytes:(%d+).-count:(%d+)")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
l_0_1, l_0_2 = tonumber(l_0_1), tonumber(l_0_2)
if 52000000 < l_0_1 and l_0_1 < 75000000 and 5500 < l_0_2 and l_0_2 < 9000 then
  bm.add_related_string("ReadVM", string.format("Bytes: %d Count: %d", l_0_1, l_0_2), bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
