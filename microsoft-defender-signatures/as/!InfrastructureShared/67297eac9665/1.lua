-- Threat: !InfrastructureShared
-- Name: 67297eac9665
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
