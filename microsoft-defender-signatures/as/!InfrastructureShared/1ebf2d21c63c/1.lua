-- Threat: !InfrastructureShared
-- Name: 1ebf2d21c63c
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
