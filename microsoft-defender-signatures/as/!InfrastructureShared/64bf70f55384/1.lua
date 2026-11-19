-- Threat: !InfrastructureShared
-- Name: 64bf70f55384
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
