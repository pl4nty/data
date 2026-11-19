-- Threat: !InfrastructureShared
-- Name: 164bf914f5bb3
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
