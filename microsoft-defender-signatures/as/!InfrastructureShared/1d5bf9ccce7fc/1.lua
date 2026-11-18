-- Threat: !InfrastructureShared
-- Name: 1d5bf9ccce7fc
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
