-- Threat: !InfrastructureShared
-- Name: 5f294af1dca9
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
