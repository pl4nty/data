-- Threat: !InfrastructureShared
-- Name: 90bf6672dc95
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
