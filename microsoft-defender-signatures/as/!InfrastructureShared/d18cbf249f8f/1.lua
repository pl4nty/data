-- Threat: !InfrastructureShared
-- Name: d18cbf249f8f
-- Type: 21

if mp.get_mpattribute("elfa_isharedlib") then
  return mp.INFECTED
end
return mp.CLEAN
