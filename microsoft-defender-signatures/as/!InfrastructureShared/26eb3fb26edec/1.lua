-- Threat: !InfrastructureShared
-- Name: 26eb3fb26edec
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[14].utf8p2
local l_0_2 = string.find(l_0_1, "Bytes:", 1, true)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = l_0_1:sub(l_0_2)
local l_0_4 = tonumber(l_0_3:match("Bytes:(%d+)"))
local l_0_5 = string.find(l_0_1, "Count:", 1, true)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = tonumber(l_0_3:match("Count:(%d+)"))
if l_0_4 and 52000000 < l_0_4 and l_0_4 < 75000000 and 5500 < l_0_6 and l_0_6 < 7000 then
  bm.add_related_string("ReadVM", "Bytes: " .. l_0_4 .. " Count: " .. l_0_6, bm.RelatedStringBMReport)
  local l_0_7, l_0_8 = pcall(reportBmInfo)
  if not l_0_7 and l_0_8 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_8), bm.RelatedStringBMReport)
  end
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
