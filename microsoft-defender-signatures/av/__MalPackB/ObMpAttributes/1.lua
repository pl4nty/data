local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = 8265
if L0_1 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.BMSearchFile
L3_1 = L0_1 - L1_1
L4_1 = L1_1
L5_1 = "UPX!\144\000"
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 and L2_1 ~= -1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
