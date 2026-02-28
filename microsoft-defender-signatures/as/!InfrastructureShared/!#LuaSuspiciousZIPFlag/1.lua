local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 67324752 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 7
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 2048 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "Lua:ZipHasLanguageEncodingFlag"
  L0_1(L1_1)
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 9
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 19
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = 23
L2_1 = L2_1(L3_1, L4_1)
if L1_1 == 0 then
  L3_1 = string
  L3_1 = L3_1.char
  L4_1 = 80
  L5_1 = 75
  L6_1 = 1
  L7_1 = 2
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = tostring
  L6_1 = footerpage
  L5_1 = L5_1(L6_1)
  L6_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = mp
  L5_1 = L5_1.readu_u32
  L6_1 = footerpage
  L7_1 = L4_1 + 20
  L5_1 = L5_1(L6_1, L7_1)
  L1_1 = L5_1
  L5_1 = mp
  L5_1 = L5_1.readu_u32
  L6_1 = footerpage
  L7_1 = L4_1 + 24
  L5_1 = L5_1(L6_1, L7_1)
  L2_1 = L5_1
end
L3_1 = L1_1 or L3_1
if L1_1 then
  L3_1 = L2_1
end
if L3_1 ~= 0 then
  L3_1 = L2_1 / L1_1
  if 5 < L3_1 then
    L4_1 = 8
    if not L4_1 then
      L4_1 = 9
    end
  end
  if L0_1 == L4_1 or 5 < L3_1 and L0_1 == 12 then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:SuspiciousZipRatioCompression"
    L4_1(L5_1)
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
