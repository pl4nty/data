-- Threat: !InfrastructureShared
-- Name: 12a29d24e0e86
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
