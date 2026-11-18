-- Threat: !InfrastructureShared
-- Name: 6229d7277289
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
