-- Threat: !InfrastructureShared
-- Name: 3f29ad663bec
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
