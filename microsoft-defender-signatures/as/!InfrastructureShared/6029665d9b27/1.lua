-- Threat: !InfrastructureShared
-- Name: 6029665d9b27
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
