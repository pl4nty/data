-- Threat: !InfrastructureShared
-- Name: 7929749a6666
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
