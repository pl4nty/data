-- Threat: !InfrastructureShared
-- Name: 3d2945812645
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
