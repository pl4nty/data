-- Threat: !InfrastructureShared
-- Name: 8dbf7c56feef
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
