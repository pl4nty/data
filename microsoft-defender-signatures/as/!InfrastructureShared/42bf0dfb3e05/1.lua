-- Threat: !InfrastructureShared
-- Name: 42bf0dfb3e05
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
