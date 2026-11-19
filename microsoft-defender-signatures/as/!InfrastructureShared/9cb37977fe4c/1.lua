-- Threat: !InfrastructureShared
-- Name: 9cb37977fe4c
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = sysio.GetFileAttributes(l_0_0)
if l_0_1 == nil or l_0_1 == 4294967295 then
  return mp.CLEAN
end
if mp.bitand(l_0_1, 2) == 2 and mp.bitand(l_0_1, 4) == 4 then
  return mp.INFECTED
end
return mp.CLEAN
