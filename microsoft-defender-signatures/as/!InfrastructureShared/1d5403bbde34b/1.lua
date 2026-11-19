-- Threat: !InfrastructureShared
-- Name: 1d5403bbde34b
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
