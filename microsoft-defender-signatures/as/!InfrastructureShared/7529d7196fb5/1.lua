-- Threat: !InfrastructureShared
-- Name: 7529d7196fb5
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
