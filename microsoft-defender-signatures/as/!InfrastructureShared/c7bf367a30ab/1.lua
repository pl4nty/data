-- Threat: !InfrastructureShared
-- Name: c7bf367a30ab
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
