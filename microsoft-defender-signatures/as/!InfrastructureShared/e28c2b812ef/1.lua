-- Threat: !InfrastructureShared
-- Name: e28c2b812ef
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
