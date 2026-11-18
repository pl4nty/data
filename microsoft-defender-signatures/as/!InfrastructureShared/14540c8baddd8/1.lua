-- Threat: !InfrastructureShared
-- Name: 14540c8baddd8
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
