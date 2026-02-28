local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 256 then
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
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readheader
L2_1 = 44
L3_1 = 16
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == "\254\255\255\255\001\000\000\000\v\000\000\000\001\000\000\000" then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
