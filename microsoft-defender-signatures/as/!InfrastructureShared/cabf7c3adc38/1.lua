-- Threat: !InfrastructureShared
-- Name: cabf7c3adc38
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
