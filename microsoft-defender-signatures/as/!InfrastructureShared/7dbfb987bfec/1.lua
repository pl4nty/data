-- Threat: !InfrastructureShared
-- Name: 7dbfb987bfec
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
