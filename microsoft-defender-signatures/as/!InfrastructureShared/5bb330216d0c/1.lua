local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1()
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
L1_1 = {}
L2_1 = "OFFICE"
L3_1 = "SCRIPTENG"
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = {}
L2_1.min = 1
L2_1.max = 5
L3_1 = QueryProcContext
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
if L0_1 then
  L3_1 = IsKeyInRollingQueue
  L4_1 = "SuspExeFileDroppedViaSMB"
  L5_1 = L0_1
  L6_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = L0_1
  L6_1 = "NewPECreatedNoCert"
  L4_1 = L4_1(L5_1, L6_1)
  if L3_1 or L4_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
