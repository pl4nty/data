-- Threat: !InfrastructureShared
-- Name: 5e292a423134
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
