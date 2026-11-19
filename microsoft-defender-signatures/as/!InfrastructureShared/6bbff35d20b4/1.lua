-- Threat: !InfrastructureShared
-- Name: 6bbff35d20b4
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
