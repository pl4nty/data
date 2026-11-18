-- Threat: !InfrastructureShared
-- Name: 9c2920698d1a
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
