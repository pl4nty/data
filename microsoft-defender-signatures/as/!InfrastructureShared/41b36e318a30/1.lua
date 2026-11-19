-- Threat: !InfrastructureShared
-- Name: 41b36e318a30
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "DestIp=([^;]*);")
if not l_0_1 or not isPublicIP(l_0_1) then
  return mp.CLEAN
end
return mp.INFECTED
