local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1, L4_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = ":\\windows\\open.bat"
L3_1 = ":\\windows\\av.bat"
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
