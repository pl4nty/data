-- Threat: !InfrastructureShared
-- Name: 5d8c5a805126
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 <= 6144 and mp.get_mpattribute("elfa_isharedlib") then
  return mp.INFECTED
end
return mp.CLEAN
