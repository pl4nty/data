-- Threat: !InfrastructureShared
-- Name: 38b35f2582f9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = getTamperProtectionSource()
if l_0_0 and mp.bitand(l_0_0, 1) == 1 then
  return mp.INFECTED
end
return mp.CLEAN
