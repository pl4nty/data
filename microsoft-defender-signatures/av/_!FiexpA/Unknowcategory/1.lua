local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = headerpage
L1_1 = L1_1[1]
L2_1 = headerpage
L2_1 = L2_1[5]
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 70 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = headerpage
L1_1 = L1_1[2]
L2_1 = headerpage
L2_1 = L2_1[6]
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 83 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = headerpage
L1_1 = L1_1[3]
L2_1 = headerpage
L2_1 = L2_1[7]
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 84 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = headerpage
L1_1 = L1_1[4]
L2_1 = headerpage
L2_1 = L2_1[8]
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 80 then
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
if 12582912 < L1_1 or L1_1 < 4096 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.bitxor
L3_1 = L0_1
L4_1 = mp
L4_1 = L4_1.readu_u32
L5_1 = headerpage
L6_1 = 9
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L4_1(L5_1, L6_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if 12582912 < L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = headerpage
L2_1 = L2_1[18]
L3_1 = mp
L3_1 = L3_1.bitand
L4_1 = headerpage
L5_1 = 17 + L2_1
L4_1 = L4_1[L5_1]
L4_1 = L2_1 + L4_1
L5_1 = 255
L3_1 = L3_1(L4_1, L5_1)
L3_1 = 17 + L3_1
L4_1 = mp
L4_1 = L4_1.readu_u16
L5_1 = headerpage
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.bitxor
L6_1 = headerpage
L6_1 = L6_1[273]
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.bitand
L7_1 = L5_1
L8_1 = 255
L6_1 = L6_1(L7_1, L8_1)
L5_1 = L6_1
if 36 < L5_1 or L5_1 < 12 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "Lua:FiexpEncPayload.A"
L6_1(L7_1)
if L0_1 ~= 0 then
  L6_1 = mp
  L6_1 = L6_1.bitxor
  L7_1 = L0_1
  L8_1 = mp
  L8_1 = L8_1.readu_u32
  L9_1 = headerpage
  L10_1 = 9
  L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 == L1_1 then
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
