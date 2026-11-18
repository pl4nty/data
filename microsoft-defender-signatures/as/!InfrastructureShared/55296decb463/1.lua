-- Threat: !InfrastructureShared
-- Name: 55296decb463
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
