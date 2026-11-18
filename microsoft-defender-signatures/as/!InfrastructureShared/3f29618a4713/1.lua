-- Threat: !InfrastructureShared
-- Name: 3f29618a4713
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
