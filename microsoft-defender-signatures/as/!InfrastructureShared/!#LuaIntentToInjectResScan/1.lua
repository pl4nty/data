local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "PACKED_WITH:[EmbeddedResource]"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u64
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= -8554208160678674432 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.BMSearchFile
L2_1 = 0
L3_1 = mp
L3_1 = L3_1.HEADERPAGE_SZ
L4_1 = "MZ\144\000\003\144\000"
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L1_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = L1_1 + 60
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readu_u16
L4_1 = headerpage
L5_1 = L1_1 + L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 17744 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
if L3_1 == nil or 10485760 < L3_1 then
  L3_1 = 10485760
end
L4_1 = mp
L4_1 = L4_1.readu_u16
L5_1 = headerpage
L6_1 = L1_1 + L2_1
L6_1 = L6_1 + 22
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.bitand
L6_1 = L4_1
L7_1 = 8192
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:DLLInEmbeddedResource"
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.readprotection
  L6_1 = false
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.readfile
  L6_1 = L1_1 - 1
  L7_1 = L3_1 - L1_1
  L7_1 = L7_1 - 1
  L5_1 = L5_1(L6_1, L7_1)
  L6_1 = mp
  L6_1 = L6_1.readprotection
  L7_1 = true
  L6_1(L7_1)
  L6_1 = mp
  L6_1 = L6_1.vfo_add_buffer
  L7_1 = L5_1
  L8_1 = "[ShelcoridDll]"
  L9_1 = mp
  L9_1 = L9_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
