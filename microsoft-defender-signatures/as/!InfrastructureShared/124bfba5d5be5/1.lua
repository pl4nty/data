-- Threat: !InfrastructureShared
-- Name: 124bfba5d5be5
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
