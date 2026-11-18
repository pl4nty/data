-- Threat: !InfrastructureShared
-- Name: 6729ff7c3f29
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
