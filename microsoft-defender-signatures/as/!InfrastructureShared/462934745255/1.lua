-- Threat: !InfrastructureShared
-- Name: 462934745255
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
