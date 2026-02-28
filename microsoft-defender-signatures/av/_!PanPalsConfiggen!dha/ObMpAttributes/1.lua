local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 528 then
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
L3_1 = 521
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = 525
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
if L0_1 == 0 or L2_1 == 0 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L0_1 ~= L2_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L1_1 > L3_1 or L2_1 > L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.readu_u32
L5_1 = headerpage
L6_1 = 5
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= 0 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.bitxor
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = headerpage
L7_1 = 513
L5_1 = L5_1(L6_1, L7_1)
L6_1 = 4227529208
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= 0 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.bitxor
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = headerpage
L7_1 = 517
L5_1 = L5_1(L6_1, L7_1)
L6_1 = 4294901244
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= 0 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
