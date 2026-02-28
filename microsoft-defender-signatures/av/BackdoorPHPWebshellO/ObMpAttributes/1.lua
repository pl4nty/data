local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.crc32
L1_1 = 0
L2_1 = headerpage
L3_1 = 1
L4_1 = 3
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if 3665532023 == L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
