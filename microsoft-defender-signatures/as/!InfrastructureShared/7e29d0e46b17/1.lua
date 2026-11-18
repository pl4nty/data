-- Threat: !InfrastructureShared
-- Name: 7e29d0e46b17
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
