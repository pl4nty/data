-- Threat: !InfrastructureShared
-- Name: 482904fcc287
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
