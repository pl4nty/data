local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = sms_untrusted_process
L0_1()
L0_1 = pcall
L1_1 = add_parents
L2_1 = "-1"
L3_1 = 5
L0_1(L1_1, L2_1, L3_1)
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1003.001"
L3_1 = "credentialdumping"
L4_1 = 86400
L0_1(L1_1, L2_1, L3_1, L4_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
