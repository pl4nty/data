-- Threat: !InfrastructureShared
-- Name: 61bf4f4285b9
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
