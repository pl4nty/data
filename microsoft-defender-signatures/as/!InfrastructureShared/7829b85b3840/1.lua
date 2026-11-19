-- Threat: !InfrastructureShared
-- Name: 7829b85b3840
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
