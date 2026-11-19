-- Threat: !InfrastructureShared
-- Name: a1b33c219973
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "Uri=([^;]+)")
if not l_0_1 then
  local l_0_2 = string.match(l_0_0, "DestIp=([^;]*);")
  if not l_0_2 or not isPublicIP(l_0_2) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
