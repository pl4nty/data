-- Threat: !InfrastructureShared
-- Name: 5829cfadbcc9
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
