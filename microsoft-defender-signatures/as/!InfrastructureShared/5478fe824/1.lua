local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = pe
L1_1 = L1_1.mmap_va
L2_1 = hstrlog
L2_1 = L2_1[1]
L2_1 = L2_1.VA
L2_1 = L2_1 + 11
L3_1 = 4
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
L1_1 = pe
L1_1 = L1_1.mmap_va
L2_1 = L0_1
L3_1 = 12
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "%w%z%w%z%w%z%w%z%w%z%z%z"
L2_1 = L2_1(L3_1, L4_1)
if 0 <= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.readu_u32
  L3_1 = pe
  L3_1 = L3_1.mmap_va
  L4_1 = hstrlog
  L4_1 = L4_1[3]
  L4_1 = L4_1.VA
  L4_1 = L4_1 + 15
  L5_1 = 4
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = 1
  L2_1 = L2_1(L3_1, L4_1)
  L0_1 = L2_1
  L2_1 = pe
  L2_1 = L2_1.mmap_va
  L3_1 = L0_1
  L4_1 = 12
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "%w%z%w%z%w%z%w%z%w%z%z%z"
  L3_1 = L3_1(L4_1, L5_1)
  if 0 <= L3_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
