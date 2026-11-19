-- Threat: !InfrastructureShared
-- Name: 18dbf4f782e34
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
