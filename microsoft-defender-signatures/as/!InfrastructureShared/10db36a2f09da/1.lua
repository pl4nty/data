local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1 = L2_1()
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1, L4_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = checkFileLastWriteTime
L2_1 = L0_1
L3_1 = 120
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= false then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.IsKnownFriendlyFile
L2_1 = L0_1
L3_1 = true
L4_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
