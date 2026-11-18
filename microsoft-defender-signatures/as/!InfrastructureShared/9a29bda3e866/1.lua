-- Threat: !InfrastructureShared
-- Name: 9a29bda3e866
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
