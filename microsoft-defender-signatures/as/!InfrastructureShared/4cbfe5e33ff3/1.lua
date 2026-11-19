-- Threat: !InfrastructureShared
-- Name: 4cbfe5e33ff3
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
