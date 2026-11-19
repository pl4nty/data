-- Threat: !InfrastructureShared
-- Name: 46bf12cea400
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
