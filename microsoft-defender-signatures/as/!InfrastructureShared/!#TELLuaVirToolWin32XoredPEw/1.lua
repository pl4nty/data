local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 <= 60 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if 0 == L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.HEADERPAGE_SZ
if L0_1 <= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = headerpage
L1_1 = L1_1[63]
if 0 ~= L1_1 then
  L1_1 = headerpage
  L1_1 = L1_1[64]
  if 0 ~= L1_1 then
    goto lbl_36
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_36::
L1_1 = headerpage
L1_1 = L1_1[63]
L2_1 = headerpage
L2_1 = L2_1[64]
if L1_1 == L2_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = headerpage
L1_1 = L1_1[63]
L2_1 = headerpage
L2_1 = L2_1[64]
L3_1 = mp
L3_1 = L3_1.bitxor
L4_1 = headerpage
L4_1 = L4_1[1]
L5_1 = L1_1
L3_1 = L3_1(L4_1, L5_1)
if 77 ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.bitxor
L4_1 = headerpage
L4_1 = L4_1[2]
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if 90 ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.bitxor
L4_1 = headerpage
L4_1 = L4_1[61]
L5_1 = L1_1
L3_1 = L3_1(L4_1, L5_1)
L3_1 = 1 + L3_1
L4_1 = mp
L4_1 = L4_1.bitxor
L5_1 = headerpage
L5_1 = L5_1[62]
L6_1 = L2_1
L4_1 = L4_1(L5_1, L6_1)
L4_1 = L4_1 * 256
L3_1 = L3_1 + L4_1
L4_1 = mp
L4_1 = L4_1.HEADERPAGE_SZ
L4_1 = L4_1 - 4
if L3_1 <= L4_1 then
  L4_1 = mp
  L4_1 = L4_1.bitxor
  L5_1 = headerpage
  L5_1 = L5_1[L3_1]
  L6_1 = L1_1
  L4_1 = L4_1(L5_1, L6_1)
  if 80 ~= L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.bitxor
  L5_1 = headerpage
  L6_1 = L3_1 + 1
  L5_1 = L5_1[L6_1]
  L6_1 = L2_1
  L4_1 = L4_1(L5_1, L6_1)
  if 69 ~= L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = headerpage
  L5_1 = L3_1 + 2
  L4_1 = L4_1[L5_1]
  if L1_1 ~= L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = headerpage
  L5_1 = L3_1 + 3
  L4_1 = L4_1[L5_1]
  if L2_1 ~= L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
