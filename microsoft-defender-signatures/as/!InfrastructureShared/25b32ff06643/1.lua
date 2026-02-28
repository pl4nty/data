local L0_1, L1_1, L2_1, L3_1
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
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
L1_1 = L1_1.INFECTED
return L1_1
