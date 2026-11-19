-- Threat: !InfrastructureShared
-- Name: 4e291e966fde
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
