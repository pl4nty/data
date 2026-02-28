local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = isTamperProtectionOn
L1_1 = false
L0_1 = L0_1(L1_1)
L1_1 = bm
L1_1 = L1_1.add_related_string
L2_1 = "TpState"
L3_1 = tostring
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L4_1 = bm
L4_1 = L4_1.RelatedStringBMReport
L1_1(L2_1, L3_1, L4_1)
L1_1 = add_parents
L1_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
