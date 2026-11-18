-- Threat: !InfrastructureShared
-- Name: 4b297abf06f5
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
