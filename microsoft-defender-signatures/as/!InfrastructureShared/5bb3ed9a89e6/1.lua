local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.utf8p1
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = 12
L1_1 = L1_1(L2_1, L3_1)
L0_1 = L1_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.utf8p2
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.utf8p1
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L2_1
L5_1 = 10
L3_1 = L3_1(L4_1, L5_1)
L2_1 = L3_1
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.utf8p2
L4_1 = bm
L4_1 = L4_1.add_threat_file
L5_1 = L0_1
L4_1(L5_1)
L4_1 = bm
L4_1 = L4_1.add_threat_file
L5_1 = L1_1
L4_1(L5_1)
L4_1 = bm
L4_1 = L4_1.add_threat_file
L5_1 = L2_1
L4_1(L5_1)
L4_1 = bm
L4_1 = L4_1.add_threat_file
L5_1 = L3_1
L4_1(L5_1)
L4_1 = add_parents
L4_1()
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
