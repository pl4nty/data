-- Threat: !InfrastructureShared
-- Name: b529b12015f1
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
