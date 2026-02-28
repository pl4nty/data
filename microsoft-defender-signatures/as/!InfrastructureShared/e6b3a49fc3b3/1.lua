local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.IsKnownFriendlyFile
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
L2_1 = false
L3_1 = false
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
