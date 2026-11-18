-- Threat: !InfrastructureShared
-- Name: d2bff3b8a57a
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
