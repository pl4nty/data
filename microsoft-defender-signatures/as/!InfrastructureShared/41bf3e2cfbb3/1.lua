-- Threat: !InfrastructureShared
-- Name: 41bf3e2cfbb3
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
