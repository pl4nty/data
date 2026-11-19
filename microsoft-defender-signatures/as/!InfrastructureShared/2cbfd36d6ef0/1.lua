-- Threat: !InfrastructureShared
-- Name: 2cbfd36d6ef0
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
