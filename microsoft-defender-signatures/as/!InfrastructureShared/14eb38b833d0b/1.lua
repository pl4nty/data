-- Threat: !InfrastructureShared
-- Name: 14eb38b833d0b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[9].utf8p2
local l_0_1 = string.find(l_0_0, "Bytes:", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0:sub(l_0_1)
local l_0_3 = tonumber(l_0_2:match("Bytes:(%d+)"))
local l_0_4 = string.find(l_0_0, "Count:", 1, true)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = tonumber(l_0_2:match("Count:(%d+)"))
if l_0_3 and 52000000 < l_0_3 and l_0_3 < 80000000 and 5500 < l_0_5 and l_0_5 < 9000 then
  bm.add_related_string("ReadVM", "Bytes: " .. l_0_3 .. " Count: " .. l_0_5, bm.RelatedStringBMReport)
  local l_0_6, l_0_7 = pcall(reportBmInfo)
  if not l_0_6 and l_0_7 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_7), bm.RelatedStringBMReport)
  end
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
