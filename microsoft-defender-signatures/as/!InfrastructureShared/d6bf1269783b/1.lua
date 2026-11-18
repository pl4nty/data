-- Threat: !InfrastructureShared
-- Name: d6bf1269783b
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
