-- Threat: !InfrastructureShared
-- Name: 3a29c4301b33
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
