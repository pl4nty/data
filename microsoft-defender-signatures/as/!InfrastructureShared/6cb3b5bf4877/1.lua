local L0_1, L1_1, L2_1, L3_1
L0_1 = pcallEx
L1_1 = "maceSendConfig"
L2_1 = maceSendConfig
L3_1 = "mace_systembc"
L0_1(L1_1, L2_1, L3_1)
L0_1 = pcallEx
L1_1 = "reportRelatedBmHits"
L2_1 = reportRelatedBmHits
L0_1(L1_1, L2_1)
L0_1 = reportRelevantUntrustedEntities
L1_1 = 1
L0_1(L1_1)
L0_1 = reportTimingData
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
