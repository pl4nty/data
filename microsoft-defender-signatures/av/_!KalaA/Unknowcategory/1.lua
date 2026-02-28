local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = peattributes
L0_1 = L0_1.lastscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 11616 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[7]
if L0_1 ~= 187 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[12]
if L0_1 ~= 185 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.crc32
L1_1 = -1
L2_1 = epcode
L3_1 = 17
L4_1 = 19
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= 1894062762 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = epcode
L3_1 = 13
L1_1 = L1_1(L2_1, L3_1)
L2_1 = pehdr
L2_1 = L2_1.ImageBase
L1_1 = L1_1 - L2_1
L2_1 = pesecs
L3_1 = pehdr
L3_1 = L3_1.NumberOfSections
L2_1 = L2_1[L3_1]
L2_1 = L2_1.VirtualAddress
L1_1 = L1_1 - L2_1
if L1_1 ~= 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
