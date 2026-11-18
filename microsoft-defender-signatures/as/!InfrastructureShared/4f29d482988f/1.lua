-- Threat: !InfrastructureShared
-- Name: 4f29d482988f
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
