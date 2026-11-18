-- Threat: !InfrastructureShared
-- Name: 256b3c308b833
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
end
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.match(l_0_0:lower(), "\\(mpksl[%w]+)")
local l_0_1 = getService(l_0_0)
if l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
