-- Threat: !InfrastructureShared
-- Name: e6bf7b2cf132
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
