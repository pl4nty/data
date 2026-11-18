-- Threat: !InfrastructureShared
-- Name: 14dbfbbc1dcd3
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
