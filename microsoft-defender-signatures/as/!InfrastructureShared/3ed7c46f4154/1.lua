local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = add_parents_mp
L0_1 = L0_1()
L1_1 = set_research_data
L2_1 = "AdditionalInfo"
L3_1 = MpCommon
L3_1 = L3_1.Base64Encode
L4_1 = safeJsonSerialize
L5_1 = L0_1
L4_1, L5_1 = L4_1(L5_1)
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
L1_1(L2_1, L3_1, L4_1, L5_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
