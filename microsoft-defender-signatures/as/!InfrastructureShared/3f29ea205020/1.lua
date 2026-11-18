-- Threat: !InfrastructureShared
-- Name: 3f29ea205020
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
