-- Threat: !InfrastructureShared
-- Name: 6b29bac145af
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
