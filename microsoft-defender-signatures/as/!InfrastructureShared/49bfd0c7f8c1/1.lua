-- Threat: !InfrastructureShared
-- Name: 49bfd0c7f8c1
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
