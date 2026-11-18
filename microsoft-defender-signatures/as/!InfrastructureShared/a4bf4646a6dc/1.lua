-- Threat: !InfrastructureShared
-- Name: a4bf4646a6dc
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
