-- Threat: !InfrastructureShared
-- Name: 160bff51ba3cc
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
