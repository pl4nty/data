-- Threat: !InfrastructureShared
-- Name: 11abfa75f5bbf
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
