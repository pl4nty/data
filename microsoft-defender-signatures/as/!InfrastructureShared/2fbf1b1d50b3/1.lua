-- Threat: !InfrastructureShared
-- Name: 2fbf1b1d50b3
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
