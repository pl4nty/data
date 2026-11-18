-- Threat: !InfrastructureShared
-- Name: 66bf84bcb34b
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
