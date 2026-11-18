-- Threat: !InfrastructureShared
-- Name: 48294090dc58
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
