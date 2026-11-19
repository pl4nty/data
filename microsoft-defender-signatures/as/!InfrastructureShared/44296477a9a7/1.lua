-- Threat: !InfrastructureShared
-- Name: 44296477a9a7
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
