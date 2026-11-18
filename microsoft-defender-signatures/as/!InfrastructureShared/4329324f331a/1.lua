-- Threat: !InfrastructureShared
-- Name: 4329324f331a
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
