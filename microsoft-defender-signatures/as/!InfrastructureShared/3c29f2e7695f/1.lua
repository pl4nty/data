-- Threat: !InfrastructureShared
-- Name: 3c29f2e7695f
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
