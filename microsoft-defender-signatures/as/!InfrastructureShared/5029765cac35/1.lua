-- Threat: !InfrastructureShared
-- Name: 5029765cac35
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
