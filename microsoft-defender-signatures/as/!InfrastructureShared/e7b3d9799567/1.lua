local L0_1, L1_1, L2_1, L3_1
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1105"
L3_1 = "CommandAndControl_IngressToolTransfer_SuspiciousCommandExecution"
L0_1(L1_1, L2_1, L3_1)
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1105"
L3_1 = "DefeseEvasion_DeobfuscateFilesOrInformation_Base64EncodeCommandExecution"
L0_1(L1_1, L2_1, L3_1)
L0_1 = addRelatedProcess
L0_1()
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
