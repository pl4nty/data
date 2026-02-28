local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
L1_1 = TrackPidAndTechnique
L2_1 = L0_1
L3_1 = "sim_tool"
L4_1 = "safebreach"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
