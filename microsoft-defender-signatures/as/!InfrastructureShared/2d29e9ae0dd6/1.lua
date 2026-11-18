-- Threat: !InfrastructureShared
-- Name: 2d29e9ae0dd6
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
