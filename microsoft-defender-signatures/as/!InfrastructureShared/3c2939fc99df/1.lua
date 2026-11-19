-- Threat: !InfrastructureShared
-- Name: 3c2939fc99df
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
