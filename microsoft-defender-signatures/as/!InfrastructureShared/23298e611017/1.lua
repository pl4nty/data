-- Threat: !InfrastructureShared
-- Name: 23298e611017
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
