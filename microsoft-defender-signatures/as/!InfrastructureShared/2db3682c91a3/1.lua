-- Threat: !InfrastructureShared
-- Name: 2db3682c91a3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[2].utf8p2
local l_0_1 = string.find(l_0_0, "Bytes:", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0:sub(l_0_1)
local l_0_3 = l_0_2:match("Bytes:(%d+)")
if l_0_3 and 6 < #l_0_3 then
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
