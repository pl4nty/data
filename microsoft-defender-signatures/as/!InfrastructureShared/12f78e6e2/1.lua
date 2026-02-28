local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = 0
L1_1 = hstrlog
L1_1 = L1_1[8]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = hstrlog
  L1_1 = L1_1[8]
  L1_1 = L1_1.VA
  L1_1 = L1_1 + 4
  L2_1 = mp
  L2_1 = L2_1.readu_u32
  L3_1 = pe
  L3_1 = L3_1.mmap_va
  L4_1 = L1_1
  L5_1 = 4
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = 1
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = pe
  L3_1 = L3_1.mmap_va
  L4_1 = L2_1
  L5_1 = 11
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "~backup.dat" then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  L0_1 = 3
end
L1_1 = mp
L1_1 = L1_1.HSTR_WEIGHT
L1_1 = L1_1 - L0_1
if 6 <= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
else
  L1_1 = mp
  L1_1 = L1_1.HSTR_WEIGHT
  L1_1 = L1_1 - L0_1
  if 4 <= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.SUSPICIOUS
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
