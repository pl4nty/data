local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[6]
L0_1 = L0_1.Size
if L0_1 ~= 34 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if L0_1 ~= 232 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.epscn_writable
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.readfile
L1_1 = pe
L1_1 = L1_1.foffset_rva
L2_1 = pehdr
L2_1 = L2_1.DataDirectory
L2_1 = L2_1[6]
L2_1 = L2_1.RVA
L1_1 = L1_1(L2_1)
L2_1 = 34
L0_1 = L0_1(L1_1, L2_1)
L1_1 = pehdr
L1_1 = L1_1.AddressOfEntryPoint
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = L0_1
L4_1 = 1
L2_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1 - L2_1
if L1_1 ~= 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.crc32
L3_1 = -1
L4_1 = L0_1
L5_1 = 5
L6_1 = 26
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= 2066038322 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
