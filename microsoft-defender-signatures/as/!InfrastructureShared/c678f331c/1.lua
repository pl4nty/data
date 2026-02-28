local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 5 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 4 <= L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[6]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[6]
    L0_1 = L0_1.VA
    L0_1 = L0_1 + 15
    L1_1 = mp
    L1_1 = L1_1.readu_u32
    L2_1 = pe
    L2_1 = L2_1.mmap_va
    L3_1 = L0_1
    L4_1 = 4
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = 1
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = pe
    L2_1 = L2_1.mmap_va
    L3_1 = L1_1
    L4_1 = 16
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L2_1
    L5_1 = 1
    L6_1 = 7
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 == "winsta0" then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
