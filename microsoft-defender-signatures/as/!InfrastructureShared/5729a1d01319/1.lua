-- Threat: !InfrastructureShared
-- Name: 5729a1d01319
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
