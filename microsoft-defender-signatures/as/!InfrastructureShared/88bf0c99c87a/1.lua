-- Threat: !InfrastructureShared
-- Name: 88bf0c99c87a
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
