-- Threat: !InfrastructureShared
-- Name: f4bfd0bb4aef
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
