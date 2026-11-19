-- Threat: !InfrastructureShared
-- Name: 3329e9450032
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
