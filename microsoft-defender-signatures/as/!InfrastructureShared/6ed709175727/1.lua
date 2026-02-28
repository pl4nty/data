local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = GetRealPidForScenario
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
L1_1 = TrackPidAndTechnique
L2_1 = L0_1
L3_1 = "T1562.001"
L4_1 = "mptamper_avastdriver"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
