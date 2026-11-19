-- Threat: !InfrastructureShared
-- Name: 330bf15d48e9d
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
