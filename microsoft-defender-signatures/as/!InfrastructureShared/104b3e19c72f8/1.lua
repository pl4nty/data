local L0_1, L1_1, L2_1, L3_1
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1567"
L3_1 = "ExfilOverWeb"
L0_1(L1_1, L2_1, L3_1)
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = add_parents
L0_1()
L0_1 = addOverallNetworkVolume
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
