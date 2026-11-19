-- Threat: !InfrastructureShared
-- Name: 5029678eb3db
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
