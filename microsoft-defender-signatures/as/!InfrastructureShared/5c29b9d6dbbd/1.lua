-- Threat: !InfrastructureShared
-- Name: 5c29b9d6dbbd
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") or mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN
