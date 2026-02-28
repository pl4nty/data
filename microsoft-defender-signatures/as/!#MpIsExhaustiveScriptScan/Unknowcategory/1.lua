local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 16777215
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 5461830 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.isparanoid
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
