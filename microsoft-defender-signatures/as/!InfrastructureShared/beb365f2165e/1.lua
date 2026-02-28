local L0_1, L1_1, L2_1, L3_1
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1552.001"
L3_1 = "CredentialAccess"
L0_1(L1_1, L2_1, L3_1)
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1074"
L3_1 = "Collection_DataStaged"
L0_1(L1_1, L2_1, L3_1)
L0_1 = addRelatedProcess
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
