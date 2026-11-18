-- Threat: !InfrastructureShared
-- Name: 51296d1e1a63
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
