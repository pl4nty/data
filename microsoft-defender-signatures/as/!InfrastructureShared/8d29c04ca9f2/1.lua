-- Threat: !InfrastructureShared
-- Name: 8d29c04ca9f2
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
