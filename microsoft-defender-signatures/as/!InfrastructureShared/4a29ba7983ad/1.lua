-- Threat: !InfrastructureShared
-- Name: 4a29ba7983ad
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
