-- Threat: !InfrastructureShared
-- Name: 11540c70a3b0d
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
