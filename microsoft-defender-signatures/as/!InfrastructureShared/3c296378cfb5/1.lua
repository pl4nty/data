-- Threat: !InfrastructureShared
-- Name: 3c296378cfb5
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
