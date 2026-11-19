-- Threat: !InfrastructureShared
-- Name: 4b295e1ff661
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
