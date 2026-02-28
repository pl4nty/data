local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = peattributes
L0_1 = L0_1.executble_image
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.epscn_islast
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 7
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 767591256 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 13
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2165836939 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "\199E\252\001\000\000\000\232\000\000\000\000X\137E\252\139E\252\131\192\240"
L1_1.xray_type = 3
L1_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 1
L4_1 = -1
L5_1 = pehdr
L5_1 = L5_1.AddressOfEntryPoint
L6_1 = pesecs
L7_1 = pehdr
L7_1 = L7_1.NumberOfSections
L6_1 = L6_1[L7_1]
L6_1 = L6_1.VirtualAddress
L5_1 = L5_1 - L6_1
L6_1 = -1
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
