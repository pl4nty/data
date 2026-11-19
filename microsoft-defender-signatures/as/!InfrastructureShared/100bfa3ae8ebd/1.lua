-- Threat: !InfrastructureShared
-- Name: 100bfa3ae8ebd
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
