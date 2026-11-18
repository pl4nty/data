-- Threat: !InfrastructureShared
-- Name: 56bf4c468c4f
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
