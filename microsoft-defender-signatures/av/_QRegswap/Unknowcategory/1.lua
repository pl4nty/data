local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 60545 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 9
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1768 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 85
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 1374221685 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = epcode
L3_1 = 93
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 49342474
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 49342474 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[123]
if L0_1 ~= 195 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 193
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 4144005181 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 197
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 4542655 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 213
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2344613632 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
