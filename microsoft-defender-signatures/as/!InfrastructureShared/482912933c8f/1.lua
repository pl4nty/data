-- Threat: !InfrastructureShared
-- Name: 482912933c8f
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
