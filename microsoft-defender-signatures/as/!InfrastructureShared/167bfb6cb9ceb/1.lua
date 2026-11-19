-- Threat: !InfrastructureShared
-- Name: 167bfb6cb9ceb
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
