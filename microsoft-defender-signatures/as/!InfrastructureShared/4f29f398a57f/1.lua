-- Threat: !InfrastructureShared
-- Name: 4f29f398a57f
-- Type: 21

if mp.get_mpattribute("//AGGR:OleFile") then
  return mp.INFECTED
end
return mp.CLEAN
