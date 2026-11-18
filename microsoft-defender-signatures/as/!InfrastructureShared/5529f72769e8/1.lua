-- Threat: !InfrastructureShared
-- Name: 5529f72769e8
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
