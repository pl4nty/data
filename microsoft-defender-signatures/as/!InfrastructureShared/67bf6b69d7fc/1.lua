-- Threat: !InfrastructureShared
-- Name: 67bf6b69d7fc
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
