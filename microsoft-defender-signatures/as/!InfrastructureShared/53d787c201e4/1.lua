local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L0_1.T1041 = "exfiltration_c2"
L0_1.T1082 = "exfiltration_systeminfo"
L0_1.T1539 = "exfiltration_browser"
L1_1 = TrackPidAndMultipleTechniques
L2_1 = "CMDHSTR"
L3_1 = L0_1
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
