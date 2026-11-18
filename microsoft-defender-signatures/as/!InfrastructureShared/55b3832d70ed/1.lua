-- Threat: !InfrastructureShared
-- Name: 55b3832d70ed
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "minidump (%d+) ")
if l_0_1 and tonumber(l_0_1) < 1500 then
  return mp.INFECTED
end
return mp.CLEAN
