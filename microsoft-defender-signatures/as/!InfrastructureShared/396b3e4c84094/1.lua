local L0_1, L1_1, L2_1, L3_1
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1647"
L3_1 = "DefenseEvasion_DefaultsPlistFileModification"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "BM_PlistModUsingDefaults"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
