-- Threat: !InfrastructureShared
-- Name: 48bf99ed258e
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
