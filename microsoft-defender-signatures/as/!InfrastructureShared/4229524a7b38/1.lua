-- Threat: !InfrastructureShared
-- Name: 4229524a7b38
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
