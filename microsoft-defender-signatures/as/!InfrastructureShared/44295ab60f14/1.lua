-- Threat: !InfrastructureShared
-- Name: 44295ab60f14
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
