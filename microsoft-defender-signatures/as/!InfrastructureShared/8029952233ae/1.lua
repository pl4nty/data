-- Threat: !InfrastructureShared
-- Name: 8029952233ae
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
