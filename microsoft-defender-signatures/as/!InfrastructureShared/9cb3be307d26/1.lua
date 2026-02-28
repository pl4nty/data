local L0_1, L1_1, L2_1, L3_1
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1040"
L3_1 = "Discovery_NetworkCapture_Sniffing_mt2023"
L0_1(L1_1, L2_1, L3_1)
L0_1 = AddTechniqueGlobal
L1_1 = "Discovery_NetworkCapture_Sniffing"
L0_1(L1_1)
L0_1 = addRelatedProcess
L0_1()
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
