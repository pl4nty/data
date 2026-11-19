-- Threat: !InfrastructureShared
-- Name: c540fa3ccd0d
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
