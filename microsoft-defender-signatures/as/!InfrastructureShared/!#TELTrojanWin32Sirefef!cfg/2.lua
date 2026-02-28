local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 ~= 2048 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = headerpage
L0_1 = L0_1[8]
if L0_1 ~= 63 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = headerpage
L1_1 = L1_1[6]
L2_1 = headerpage
L2_1 = L2_1[7]
if L0_1 == L2_1 and L2_1 == L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 9
L4_1 = 2040
L5_1 = 8
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = headerpage
  L8_1 = L6_1 + 7
  L7_1 = L7_1[L8_1]
  if L0_1 == L7_1 then
    L7_1 = headerpage
    L8_1 = L6_1 + 6
    L7_1 = L7_1[L8_1]
    if L2_1 == L7_1 then
      goto lbl_44
    end
  end
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  do return L7_1 end
  ::lbl_44::
  if L6_1 < 32 then
    L7_1 = headerpage
    L8_1 = L6_1 + 5
    L7_1 = L7_1[L8_1]
    if L1_1 ~= L7_1 then
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
  else
    L7_1 = headerpage
    L8_1 = L6_1 + 5
    L7_1 = L7_1[L8_1]
    L7_1 = L1_1 - L7_1
    if not (L7_1 < -1) then
      L7_1 = headerpage
      L8_1 = L6_1 + 5
      L7_1 = L7_1[L8_1]
      L7_1 = L1_1 - L7_1
      if not (1 < L7_1) then
        goto lbl_70
      end
    end
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  ::lbl_70::
end
L3_1 = mp
L3_1 = L3_1.readu_u32
L4_1 = headerpage
L5_1 = 5
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readu_u32
L5_1 = headerpage
L6_1 = 2045
L4_1 = L4_1(L5_1, L6_1)
if L3_1 <= L4_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 1
L4_1 = 2016
L5_1 = 8
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = mp
  L7_1 = L7_1.readu_u32
  L8_1 = headerpage
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = mp
  L8_1 = L8_1.readu_u32
  L9_1 = headerpage
  L10_1 = L6_1 + 8
  L8_1 = L8_1(L9_1, L10_1)
  if L7_1 ~= L8_1 then
    L7_1 = mp
    L7_1 = L7_1.readu_u32
    L8_1 = headerpage
    L9_1 = L6_1
    L7_1 = L7_1(L8_1, L9_1)
    L8_1 = mp
    L8_1 = L8_1.readu_u32
    L9_1 = headerpage
    L10_1 = L6_1 + 16
    L8_1 = L8_1(L9_1, L10_1)
    if L7_1 ~= L8_1 then
      L7_1 = mp
      L7_1 = L7_1.readu_u32
      L8_1 = headerpage
      L9_1 = L6_1 + 8
      L7_1 = L7_1(L8_1, L9_1)
      L8_1 = mp
      L8_1 = L8_1.readu_u32
      L9_1 = headerpage
      L10_1 = L6_1 + 16
      L8_1 = L8_1(L9_1, L10_1)
      if L7_1 ~= L8_1 then
        goto lbl_129
      end
    end
  end
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  do return L7_1 end
  ::lbl_129::
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
