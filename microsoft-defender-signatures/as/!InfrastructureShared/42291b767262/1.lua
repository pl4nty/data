-- Threat: !InfrastructureShared
-- Name: 42291b767262
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
