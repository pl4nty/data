local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
L1_1 = "CabDroppedByExcel"
L2_1 = MpCommon
L2_1 = L2_1.QueryPersistContext
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = MpCommon
  L3_1 = L3_1.AppendPersistContext
  L4_1 = L0_1
  L5_1 = L1_1
  L6_1 = 100
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "MpDisableCaching"
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
