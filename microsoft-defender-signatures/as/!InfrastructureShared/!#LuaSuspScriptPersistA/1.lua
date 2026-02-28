local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L1_1 = string
L1_1 = L1_1.lower
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L0_1
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
L0_1 = L1_1
L1_1 = {}
L2_1 = table
L2_1 = L2_1.insert
L3_1 = L1_1
L4_1 = L0_1
L2_1(L3_1, L4_1)
L2_1 = MpCommon
L2_1 = L2_1.SetPersistContextNoPath
L3_1 = "SuspScriptPersist"
L4_1 = L1_1
L5_1 = 0
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
