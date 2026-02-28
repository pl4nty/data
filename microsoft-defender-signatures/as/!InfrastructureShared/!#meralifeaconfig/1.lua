local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 256 or 16777216 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 2254718286 then
  L1_1 = mp
  L1_1 = L1_1.readu_u32
  L2_1 = headerpage
  L3_1 = 1
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= 21775694 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = headerpage
L3_1 = 3
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = 5
L2_1 = L2_1(L3_1, L4_1)
if L2_1 < 8 or L0_1 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = 0
L5_1 = L0_1
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.writeu_u16
L5_1 = L3_1
L6_1 = 1
L7_1 = 23117
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.writeu_u32
L5_1 = L3_1
L6_1 = 61
L7_1 = L2_1
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.writeu_u32
L5_1 = L3_1
L6_1 = L2_1 + 1
L7_1 = 17744
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.writeu_u16
L5_1 = L3_1
L6_1 = L2_1 + 5
L7_1 = L1_1
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.vfo_add_buffer
L5_1 = L3_1
L6_1 = "MeraCfg"
L7_1 = mp
L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
