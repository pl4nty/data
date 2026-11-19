-- Threat: !InfrastructureShared
-- Name: f8bf350a6716
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
