-- Threat: !InfrastructureShared
-- Name: 5f2988c689e1
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
