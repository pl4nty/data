-- Threat: !InfrastructureShared
-- Name: 42bfd26b8af4
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
