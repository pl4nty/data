local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 4096 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 5
L1_1 = L1_1(L2_1, L3_1)
if L0_1 == 0 or L1_1 == 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L3_1 = L2_1
L2_1 = L2_1.find
L4_1 = "\000"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == nil or L2_1 < 9 or 256 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.bitxor
L4_1 = L0_1
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = headerpage
L7_1 = L2_1 + 1
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= 15227469 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.bitxor
L4_1 = L1_1
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = headerpage
L7_1 = L2_1 + 5
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= 1526726656 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
