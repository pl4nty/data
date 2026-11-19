-- Threat: !InfrastructureShared
-- Name: 5c296600ef3f
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
