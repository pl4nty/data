local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "BM_Timestomp"
L0_1(L1_1)
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1070.006"
L3_1 = "DefenseEvasion_IndicatorRemoval_TimeStompTouch"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
