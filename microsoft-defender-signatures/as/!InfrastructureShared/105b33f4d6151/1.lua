-- Threat: !InfrastructureShared
-- Name: 105b33f4d6151
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "DestIp=([^;]*);")
if not l_0_1 or not isPublicIP(l_0_1) then
  return mp.CLEAN
end
return mp.INFECTED
