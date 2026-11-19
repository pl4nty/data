-- Threat: !InfrastructureShared
-- Name: 166bf06f6bf9c
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
