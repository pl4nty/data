-- Threat: !InfrastructureShared
-- Name: 69290013dca9
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") or mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") or mp.get_mpattribute("LNK_Classifier:IsUnicode") or mp.get_mpattribute("LNK_Classifier:RunMinimize") or mp.get_mpattribute("LNK_Classifier:HasArguments") then
  return mp.INFECTED
end
return mp.CLEAN
