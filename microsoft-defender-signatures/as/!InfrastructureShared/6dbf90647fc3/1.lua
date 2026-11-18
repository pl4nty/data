-- Threat: !InfrastructureShared
-- Name: 6dbf90647fc3
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
