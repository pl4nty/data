-- Threat: !InfrastructureShared
-- Name: 908cd18f750a
-- Type: 21

if not mp.get_mpattribute("elfa_isharedlib") then
  return mp.CLEAN
end
return mp.INFECTED
