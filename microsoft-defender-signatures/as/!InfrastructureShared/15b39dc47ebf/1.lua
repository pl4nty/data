-- Threat: !InfrastructureShared
-- Name: 15b39dc47ebf
-- Type: 21
-- Includes: SocksProcessLearningInfra

local l_0_0, l_0_1 = Infrastructure_ObserveSocksProcess("", "")
if l_0_1 then
  bm.add_related_string("SocksProcessLearningStatus", l_0_1, bm.RelatedStringBMReport)
end
return mp.CLEAN
